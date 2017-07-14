package com.morxeen.tool.excelimporter.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.morxeen.framework.annotation.Header;
import com.morxeen.framework.base.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by Zhu Jian on 2017/7/11.
 */
@Entity
@Table(name = "tbl_excelimporter_buildingdevice")
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class ExcelImporterBuildingDevice extends BaseEntity {
    @Header(name="用户")
    @Column(name="user_id")
    private String userId;

    @Header(name = "表单名")
    @Column(name = "sheet_name")
    private String sheetName;

    @Header(name = "顺序")
    @Column(name = "order_index")
    private int orderIndex;

    @Header(name = "位置")
    @Column(name = "location")
    private String location;

    @Header(name = "监控设备与项目")
    @Column(name = "devicename_or_objectname")
    private String devicenameOrObjectname;

    @Header(name = "监控设备与项目ID")
    @Column(name = "deviceid_or_objectid")
    private String deviceidOrObjectid;

    // BinaryInput: 0
    // BinaryOutput: 1
    // AnalogInput: 2
    // AnalogOutput: 3
    @Header(name = "项目类型")
    @Column(name = "object_type")
    private int objectType;

    @Header(name = "传感器或执行机构")
    @Column(name = "sensor")
    private String sensor;

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

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDevicenameOrObjectname() {
        return devicenameOrObjectname;
    }

    public void setDevicenameOrObjectname(String devicenameOrObjectname) {
        this.devicenameOrObjectname = devicenameOrObjectname;
    }

    public String getDeviceidOrObjectid() {
        return deviceidOrObjectid;
    }

    public void setDeviceidOrObjectid(String deviceidOrObjectid) {
        this.deviceidOrObjectid = deviceidOrObjectid;
    }

    public int getObjectType() {
        return objectType;
    }

    public void setObjectType(int objectType) {
        this.objectType = objectType;
    }

    public String getSensor() {
        return sensor;
    }

    public void setSensor(String sensor) {
        this.sensor = sensor;
    }
}
