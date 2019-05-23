package com.zh.dto;

/**
 * @author abs
 * @Date 2019/4/7 - 16:51
 */
public class DetailPaperDto {
    private String userId;
    private String paperId;
    private Integer page;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }
}
