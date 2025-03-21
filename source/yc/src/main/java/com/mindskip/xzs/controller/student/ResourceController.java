package com.mindskip.xzs.controller.student;

import com.mindskip.xzs.domain.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
public class ResourceController {

    // 假设视频和课件存储的路径
    private static final String VIDEOS_DIR = "D:\\Workshop\\week19\\hdt\\week18\\xzs-mysql-master\\source\\xzs\\uploads\\video";
    private static final String PRESENTATIONS_DIR = "D:\\Workshop\\week19\\hdt\\week18\\xzs-mysql-master\\source\\xzs\\uploads\\pdf";

    // 获取视频列表的API
    @GetMapping("/videos")
    public ResponseEntity<List<Resource>> getVideos() {
        List<Resource> videoList = new ArrayList<>();
        try {
            File videoDir = new File(VIDEOS_DIR);
            if (videoDir.isDirectory()) {
                for (File file : videoDir.listFiles()) {
                    if (file.isFile()) {
                        videoList.add(new Resource(
                                file.getName(),
                                file.getName().split("\\.")[0],
                                "videos/" + file.getName(),
                                "视频描述",
                                0
                        ));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return ResponseEntity.ok(videoList);
    }

    // 获取课件列表的API
    @GetMapping("/presentations")
    public ResponseEntity<List<Resource>> getPresentations() {
        List<Resource> presentationList = new ArrayList<>();
        try {
            File presentationDir = new File(PRESENTATIONS_DIR);
            if (presentationDir.isDirectory()) {
                for (File file : presentationDir.listFiles()) {
                    if (file.isFile()) {
                        presentationList.add(new Resource(
                                file.getName(),
                                file.getName().split("\\.")[0],
                                "presentations/" + file.getName(),
                                "课件描述",
                                0
                        ));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return ResponseEntity.ok(presentationList);
    }
}
