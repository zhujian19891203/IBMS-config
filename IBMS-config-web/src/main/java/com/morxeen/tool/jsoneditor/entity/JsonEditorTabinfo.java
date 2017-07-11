package com.morxeen.tool.jsoneditor.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.morxeen.framework.annotation.Header;
import com.morxeen.framework.base.entity.BaseEntity;
import org.hibernate.annotations.Type;

import javax.persistence.*;

/**
 * Created by zhujian on 2017/7/6.
 */
@Entity
@Table(name = "tbl_jsoneditor_tabinfo")
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class JsonEditorTabinfo extends BaseEntity {
    @Header(name="用户")
    @Column(name="user_id")
    private String userId;

    @Header(name="内容")
    @Lob
    @Basic(fetch = FetchType.LAZY)
    @Type(type="text")
    @Column(name="content")
    private String content;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}