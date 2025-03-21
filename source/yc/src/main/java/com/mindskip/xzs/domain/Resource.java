package com.mindskip.xzs.domain;

public class Resource {
    private String id;
    private String title;
    private String path;
    private String description;
    private int likes;

    public Resource(String id, String title, String path, String description, int likes) {
        this.id = id;
        this.title = title;
        this.path = path;
        this.description = description;
        this.likes = likes;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }
}

