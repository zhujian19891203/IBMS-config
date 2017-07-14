package com.morxeen.tool.excelimporter.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.morxeen.framework.annotation.Header;
import com.morxeen.framework.base.entity.BaseEntity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by zhujian on 2017/7/7.
 */
@Entity
@Table(name = "tbl_excelimporter_camera")
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class ExcelImporterCamera extends BaseEntity {
    @Header(name="用户")
    @Column(name="user_id")
    private String userId;

    @Header(name = "表单名")
    @Column(name = "sheet_name")
    private String sheetName;

    @Header(name = "顺序")
    @Column(name = "order_index")
    private int orderIndex;

    @Header(name = "编号")
    @Column(name = "serial_number")
    private String serialNumber;

    @Header(name = "名字")
    @Column(name = "name")
    private String name;

    @Header(name = "链接")
    @Column(name = "url")
    private String url;

    @Header(name = "型号")
    @Column(name = "type")
    private String type;

    @Header(name = "端口")
    @Column(name = "port")
    private int port;

    @Header(name = "帐号")
    @Column(name = "username")
    private String username;

    @Header(name = "密码")
    @Column(name = "password")
    private String password;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSheetName() {
        return sheetName;
    }

    public void setSheetName(String sheetName) {
        this.sheetName = sheetName;
    }

    public int getOrderIndex() {
        return orderIndex;
    }

    public void setOrderIndex(int orderIndex) {
        this.orderIndex = orderIndex;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public ExcelImporterCamera() {

    }
}
