package com.mindskip.xzs.service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.nio.file.*;
import java.util.Objects;
import java.util.UUID;
public class FileStorageService {
    @Value("${file.upload-dir}")
    private String uploadDir;
    private Path fileStorageLocation;


    @PostConstruct
    public void init() {
        this.fileStorageLocation = Paths.get(uploadDir).toAbsolutePath().normalize();
        try {
            Files.createDirectories(this.fileStorageLocation);
            logger.info("文件存储目录初始化成功: {}", this.fileStorageLocation);
        } catch (Exception ex) {
            logger.error("目录创建失败: {} | 错误: {}", this.fileStorageLocation, ex.getMessage());
            throw new RuntimeException("无法创建文件存储目录", ex);
        }
    }
    private static final Logger logger = LoggerFactory.getLogger(FileStorageService.class);
    private String generateUniqueFilename(String originalFilename) {
        String extension = FilenameUtils.getExtension(originalFilename);
        String uuid = UUID.randomUUID().toString();
        String safeName = StringUtils.cleanPath(originalFilename);
        return uuid + "_" + safeName;
    }
    public String store(MultipartFile file, String directory) throws IOException {
        String filename = generateUniqueFilename(file.getOriginalFilename());
        Path storageDir =  fileStorageLocation.resolve(directory);
        Files.createDirectories(storageDir);
        Path targetPath = storageDir.resolve(filename);
        Files.copy(file.getInputStream(), targetPath, StandardCopyOption.REPLACE_EXISTING);
        return "api/file/" + directory + "/" + filename;
    }
}