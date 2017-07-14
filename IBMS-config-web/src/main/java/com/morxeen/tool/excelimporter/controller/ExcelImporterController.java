package com.morxeen.tool.excelimporter.controller;

import com.morxeen.framework.base.pojo.Result;
import com.morxeen.framework.base.service.BaseService;
import com.morxeen.framework.util.SecurityUtil;
import com.morxeen.framework.utils.StrUtil;
import com.morxeen.tool.excelimporter.entity.ExcelImporterBuildingDevice;
import com.morxeen.tool.excelimporter.entity.ExcelImporterCamera;
import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by zhujian on 2017/7/7.
 */

@Controller
@RequestMapping(value = "excelimporter")
public class ExcelImporterController {
    @RequestMapping(value = "/camera", method = RequestMethod.GET)
    public String camera() {
        return "tool/excelimporter/camera";
    }

    @RequestMapping(value = "/camera/upload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> cameraUpload(HttpServletRequest request) {
        Map<String, String> resultMap = new HashMap<>();
        resultMap.clear();

        // 将当前上下文初始化给 CommonsMutipartResolver (多部分解析器）
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        // 检查form中是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            // 将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
            // 获取multiRequest 中所有的文件名
            Iterator iter = multiRequest.getFileNames();
            // 前端确保只有一个文件会上传
            while (iter.hasNext()) {
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    try {
                        Workbook workbook = WorkbookFactory.create(file.getInputStream());
                        int sheetCount = workbook.getNumberOfSheets();
                        List<ExcelImporterCamera> cameraList = new ArrayList<>();
                        cameraList.clear();
                        for (int i = 0; i < sheetCount; i++) {
                            Sheet sheet = workbook.getSheetAt(i);
                            String sheetName = sheet.getSheetName();
                            int serialNumberIdx = -1;
                            int nameIdx = -1;
                            int urlIdx = -1;
                            int typeIdx = -1;
                            int portIdx = -1;
                            int usernameIdx = -1;
                            int passwordIdx = -1;
                            int rowCount = sheet.getPhysicalNumberOfRows();
                            for (int j = 0; j < rowCount; j++) {
                                Row row = sheet.getRow(j);
                                int cellCount = row.getPhysicalNumberOfCells();
                                if (j == 0) {
                                    for (int k = 0; k < cellCount; k++) {
                                        Cell cell = row.getCell(k);
                                        if (cell != null) {
                                            if (cell.getStringCellValue().replace(" ", "").equals("编号")) {
                                                serialNumberIdx = k;
                                            } else if (cell.getStringCellValue().replace(" ", "").equals("名字")) {
                                                nameIdx = k;
                                            } else if (cell.getStringCellValue().replace(" ", "").equals("链接")) {
                                                urlIdx = k;
                                            } else if (cell.getStringCellValue().replace(" ", "").equals("型号")) {
                                                typeIdx = k;
                                            } else if (cell.getStringCellValue().replace(" ", "").equals("端口")) {
                                                portIdx = k;
                                            } else if (cell.getStringCellValue().replace(" ", "").equals("帐号")) {
                                                usernameIdx = k;
                                            } else if (cell.getStringCellValue().replace(" ", "").equals("密码")) {
                                                passwordIdx = k;
                                            }
                                        }
                                    }
                                    if (urlIdx == -1 || portIdx == -1 || usernameIdx == -1 || passwordIdx == -1) {
                                        logger.error("Import camera: data in Excel " + file.getOriginalFilename() + " sheetname " + sheetName + " is not valid!");
                                        break;
                                    }
                                } else {
                                    ExcelImporterCamera camera = new ExcelImporterCamera();
                                    Cell cell;
                                    String serialNumber = "";
                                    if (serialNumberIdx != -1) {
                                        cell = getMergedRegionValue(sheet, j, serialNumberIdx);
                                        if (cell != null && cell.getCellTypeEnum() == CellType.STRING) {
                                            serialNumber = cell.getStringCellValue().replace(" ", "");
                                        }
                                    }
                                    String name = "";
                                    if (nameIdx != -1) {
                                        cell = getMergedRegionValue(sheet, j, nameIdx);
                                        if (cell != null && cell.getCellTypeEnum() == CellType.STRING) {
                                            name = cell.getStringCellValue().replace(" ", "");
                                        }
                                    }
                                    String url = "";
                                    cell = getMergedRegionValue(sheet, j, urlIdx);
                                    if (cell != null && cell.getCellTypeEnum() == CellType.STRING) {
                                        url = cell.getStringCellValue().replace(" ", "");
                                    }
                                    if (url.equals("")) {
                                        continue;
                                    }
                                    String type = "";
                                    if (typeIdx != -1) {
                                        cell = getMergedRegionValue(sheet, j, typeIdx);
                                        if (cell != null && cell.getCellTypeEnum() == CellType.STRING) {
                                            type = cell.getStringCellValue().replace(" ", "");
                                        }
                                    }
                                    int port = -1;
                                    cell = getMergedRegionValue(sheet, j, portIdx);
                                    if (cell != null && cell.getCellTypeEnum() == CellType.NUMERIC) {
                                        port = (int)cell.getNumericCellValue();
                                    }
                                    else if (cell != null && cell.getCellTypeEnum() == CellType.STRING) {
                                        port = Integer.parseInt(cell.getStringCellValue().replace(" ", ""));
                                    }
                                    if (port == -1) {
                                        continue;
                                    }
                                    String username = "";
                                    cell = getMergedRegionValue(sheet, j, usernameIdx);
                                    if (cell != null && cell.getCellTypeEnum() == CellType.STRING) {
                                        username = cell.getStringCellValue().replace(" ", "");
                                    }
                                    if (username.equals("")) {
                                        continue;
                                    }
                                    String password = "";
                                    cell = getMergedRegionValue(sheet, j, passwordIdx);
                                    if (cell != null && cell.getCellTypeEnum() == CellType.STRING) {
                                        password = cell.getStringCellValue().replace(" ", "");
                                    }
                                    else if (cell != null && cell.getCellTypeEnum() == CellType.NUMERIC) {
                                        password = String.valueOf((int)cell.getNumericCellValue());
                                    }
                                    if (password.equals("")) {
                                        continue;
                                    }
                                    camera.setSheetName(sheetName);
                                    camera.setSerialNumber(serialNumber);
                                    camera.setName(name);
                                    camera.setUrl(url);
                                    camera.setType(type);
                                    camera.setPort(port);
                                    camera.setUsername(username);
                                    camera.setPassword(password);

                                    cameraList.add(camera);
                                }
                            }
                        }
                        if(cameraList.size() > 0) {
                            // 删除表中所有元素
                            baseService.executeHql("DELETE FROM ExcelImporterCamera");
                            // 插入数据
                            baseService.batchSave(cameraList);
                        }
                        // else说明无数据可导入
                        else {
                            resultMap.put("error", "上传的文件格式有问题，请检查后重试");
                        }
                    } catch (Exception e) {
                        logger.error("Import camera: load Excel " + file.getOriginalFilename() + " occurs error: " + e);
                        resultMap.put("error", "内部服务错误，请重试");
                    }
                }
                else {
                    logger.error("Import camera: load Excel occurs error: file is null!");
                    resultMap.put("error", "内部服务错误，请重试");
                }
            }
        }
        else {
            resultMap.put("error", "内部服务错误，请重试");
        }

        return resultMap;
    }

    @RequestMapping(value = "/camera/edit", method = RequestMethod.GET)
    public String cameraEdit(@RequestParam(value="id", required=false) String id,
                       HttpServletRequest request) {
        if(id == null) {
            return "tool/excelimporter/camera_edit";
        }
        else {
            request.setAttribute("id", id);
            return "tool/excelimporter/camera_edit";
        }
    }

    @RequestMapping(value = "/camera/get/{id}", method = RequestMethod.POST)
    @ResponseBody
    private ExcelImporterCamera cameraGet(@PathVariable("id") String id) {
        return baseService.get(ExcelImporterCamera.class, id);
    }

    @RequestMapping(value = "/camera/save", method = RequestMethod.POST)
    @ResponseBody
    public Result cameraSave(ExcelImporterCamera obj) {
        if (StrUtil.isEmpty(obj.getId())) {
            obj.setCreateDateTime(new Date());
            obj.setUpdateDateTime(new Date());
            obj.setDeleted(0);
            obj.setVersion(0);
            obj.setUserId(SecurityUtil.getUserId());
            baseService.save(obj);
        } else {
            ExcelImporterCamera camera = baseService.get(ExcelImporterCamera.class, obj.getId());
            camera.setUpdateDateTime(new Date());
            camera.setUserId(SecurityUtil.getUserId());
            camera.setSheetName(obj.getSheetName());
            camera.setSerialNumber(obj.getSerialNumber());
            camera.setName(obj.getName());
            camera.setUrl(obj.getUrl());
            camera.setType(obj.getType());
            camera.setPort(obj.getPort());
            camera.setUsername(obj.getUsername());
            camera.setPassword(obj.getPassword());
            baseService.update(camera);
        }
        return new Result();
    }

    @RequestMapping(value = "/camera/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    private Result cameraDelete(@PathVariable("id") String id) {
        ExcelImporterCamera camera = baseService.get(ExcelImporterCamera.class, id);
        try {
            baseService.delete(camera);
        }
        catch (Exception e) {
            return new Result(false);
        }

        return new Result(true);
    }

    @RequestMapping(value = "/buildingdevice", method = RequestMethod.GET)
    public String buildingdevice() {
        return "tool/excelimporter/buildingdevice";
    }

    @RequestMapping(value = "/buildingdevice/upload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> buildingdeviceUpload(HttpServletRequest request) {
        Map<String, String> resultMap = new HashMap<>();
        resultMap.clear();

        // 将当前上下文初始化给 CommonsMutipartResolver (多部分解析器）
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        // 检查form中是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            // 将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
            // 获取multiRequest 中所有的文件名
            Iterator iter = multiRequest.getFileNames();
            // 前端确保只有一个文件会上传
            while (iter.hasNext()) {
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    try {
                        Workbook workbook = WorkbookFactory.create(file.getInputStream());
                        int sheetCount = workbook.getNumberOfSheets();
                        List<ExcelImporterBuildingDevice> buildingdeviceList = new ArrayList<>();
                        buildingdeviceList.clear();
                        for (int i = 0; i < sheetCount; i++) {
                            Sheet sheet = workbook.getSheetAt(i);
                            String sheetName = sheet.getSheetName();
                            int locationIdx = -1;
                            int devicenameOrObjectnameIdx = -1;
                            int deviceidOrObjectidIdx = -1;
                            int binaryInputIdx = -1;
                            int binaryOutputIdx = -1;
                            int analogInputIdx = -1;
                            int analogOutputIdx = -1;
                            int sensorIdx = -1;
                            int rowCount = sheet.getPhysicalNumberOfRows();
                            for (int j = 0; j < rowCount; j++) {
                                Row row = sheet.getRow(j);
                                int cellCount = row.getPhysicalNumberOfCells();
                                if (j == 0) {
                                    for (int k = 0; k < cellCount; k++) {
                                        Cell cell = row.getCell(k);
                                        if (cell != null) {
                                            if (cell.getStringCellValue().replace(" ", "").equals("位置")) {
                                                locationIdx = k;
                                            } else if (cell.getStringCellValue().replace(" ", "").equals("监控设备与项目")) {
                                                devicenameOrObjectnameIdx = k;
                                            } else if (cell.getStringCellValue().replace(" ", "").equals("监控设备与项目ID")) {
                                                deviceidOrObjectidIdx = k;
                                            } else if (cell.getStringCellValue().replace(" ", "").equals("BI")) {
                                                binaryInputIdx = k;
                                            } else if(cell.getStringCellValue().replace(" ", "").equals("BO")) {
                                                binaryOutputIdx = k;
                                            } else if(cell.getStringCellValue().replace(" ", "").equals("AI")) {
                                                analogInputIdx = k;
                                            } else if(cell.getStringCellValue().replace(" ", "").equals("AO")) {
                                                analogOutputIdx = k;
                                            } else if(cell.getStringCellValue().replace(" ", "").equals("传感器或执行机构")) {
                                                sensorIdx = k;
                                            }
                                        }
                                    }
                                    if (devicenameOrObjectnameIdx == -1 || deviceidOrObjectidIdx == -1 || binaryInputIdx == -1 ||
                                            binaryOutputIdx == -1 || analogInputIdx == -1 || analogOutputIdx == -1) {
                                        logger.error("Import buildingdevice: data in Excel " + file.getOriginalFilename() + " sheetname " + sheetName + " is not valid!");
                                        break;
                                    }
                                } else {
                                    ExcelImporterBuildingDevice buildingdevice = new ExcelImporterBuildingDevice();
                                    Cell cell;
                                    boolean isObject = false;
                                    String location = "";
                                    if (locationIdx != -1) {
                                        cell = getMergedRegionValue(sheet, j, locationIdx);
                                        if (cell != null && cell.getCellTypeEnum() == CellType.STRING) {
                                            location = cell.getStringCellValue().replace(" ", "");
                                        }
                                    }
                                    String devicenameOrObjectname = "";
                                    cell = getMergedRegionValue(sheet, j, devicenameOrObjectnameIdx);
                                    if (cell != null && cell.getCellTypeEnum() == CellType.STRING) {
                                        devicenameOrObjectname = cell.getStringCellValue().replace(" ", "");
                                    }
                                    if (devicenameOrObjectname.equals("")) {
                                        continue;
                                    }
                                    String deviceidOrObjectid = "";
                                    cell = getMergedRegionValue(sheet, j, deviceidOrObjectidIdx);
                                    if (cell != null && cell.getCellTypeEnum() == CellType.STRING) {
                                        deviceidOrObjectid = cell.getStringCellValue().replace(" ", "");
                                    }
                                    if (deviceidOrObjectid.equals("")) {
                                        continue;
                                    }
                                    else {
                                        if (deviceidOrObjectid.contains("device_") && deviceidOrObjectid.contains("DDC_")) {
                                            int beginIdx1 = 7;
                                            int endIdx1 = deviceidOrObjectid.indexOf(",");
                                            try {
                                                Integer.parseInt(deviceidOrObjectid.substring(beginIdx1, endIdx1));
                                            }
                                            catch (Exception e) {
                                                continue;
                                            }

                                            int beginIdx2 = endIdx1 + 5;
                                            try {
                                                Integer.parseInt(deviceidOrObjectid.substring(beginIdx2));
                                            }
                                            catch (Exception e) {
                                                continue;
                                            }
                                        }
                                        else if (deviceidOrObjectid.contains("object_")) {
                                            int beginIdx = 7;
                                            try {
                                                Integer.parseInt(deviceidOrObjectid.substring(beginIdx));
                                            }
                                            catch (Exception e) {
                                                continue;
                                            }
                                            isObject = true;
                                        }
                                        else {
                                            continue;
                                        }
                                    }
                                    int objectType = -1;
                                    if(isObject) {
                                        cell = getMergedRegionValue(sheet, j, binaryInputIdx);
                                        if(cell != null && (cell.getCellTypeEnum() == CellType.NUMERIC || cell.getCellTypeEnum() == CellType.STRING ||
                                                cell.getCellTypeEnum() == CellType.FORMULA || cell.getCellTypeEnum() == CellType.BOOLEAN)) {
                                            objectType = 0;
                                        }
                                        else {
                                            cell = getMergedRegionValue(sheet, j, binaryOutputIdx);
                                            if(cell != null && (cell.getCellTypeEnum() == CellType.NUMERIC || cell.getCellTypeEnum() == CellType.STRING ||
                                                    cell.getCellTypeEnum() == CellType.FORMULA || cell.getCellTypeEnum() == CellType.BOOLEAN)) {
                                                objectType = 1;
                                            }
                                            else {
                                                cell = getMergedRegionValue(sheet, j, analogInputIdx);
                                                if(cell != null && (cell.getCellTypeEnum() == CellType.NUMERIC || cell.getCellTypeEnum() == CellType.STRING ||
                                                        cell.getCellTypeEnum() == CellType.FORMULA || cell.getCellTypeEnum() == CellType.BOOLEAN)) {
                                                    objectType = 2;
                                                }
                                                else {
                                                    cell = getMergedRegionValue(sheet, j, analogOutputIdx);
                                                    if(cell != null && (cell.getCellTypeEnum() == CellType.NUMERIC || cell.getCellTypeEnum() == CellType.STRING ||
                                                            cell.getCellTypeEnum() == CellType.FORMULA || cell.getCellTypeEnum() == CellType.BOOLEAN)) {
                                                        objectType = 3;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    String sensor = "";
                                    if(sensorIdx != -1) {
                                        cell = getMergedRegionValue(sheet, j, sensorIdx);
                                        if (cell != null && cell.getCellTypeEnum() == CellType.STRING) {
                                            sensor = cell.getStringCellValue().replace(" ", "");
                                        }
                                    }
                                    buildingdevice.setSheetName(sheetName);
                                    buildingdevice.setLocation(location);
                                    buildingdevice.setDevicenameOrObjectname(devicenameOrObjectname);
                                    buildingdevice.setDeviceidOrObjectid(deviceidOrObjectid);
                                    buildingdevice.setObjectType(objectType);
                                    buildingdevice.setSensor(sensor);

                                    buildingdeviceList.add(buildingdevice);
                                }
                            }
                        }
                        if(buildingdeviceList.size() > 0) {
                            // 删除表中所有元素
                            baseService.executeHql("DELETE FROM ExcelImporterBuildingDevice");
                            // 插入数据
                            baseService.batchSave(buildingdeviceList);
                        }
                        // else说明无数据可导入
                        else {
                            resultMap.put("error", "上传的文件格式有问题，请检查后重试");
                        }
                    } catch (Exception e) {
                        logger.error("Import buildingdevice: load Excel " + file.getOriginalFilename() + " occurs error: " + e);
                        resultMap.put("error", "内部服务错误，请重试");
                    }
                }
                else {
                    logger.error("Import buildingdevice: load Excel occurs error: file is null!");
                    resultMap.put("error", "内部服务错误，请重试");
                }
            }
        }
        else {
            resultMap.put("error", "内部服务错误，请重试");
        }

        return resultMap;
    }

    @RequestMapping(value = "/buildingdevice/edit", method = RequestMethod.GET)
    public String buildingdeviceEdit(@RequestParam(value="id", required=false) String id,
                             HttpServletRequest request) {
        if(id == null) {
            return "tool/excelimporter/buildingdevice_edit";
        }
        else {
            request.setAttribute("id", id);
            return "tool/excelimporter/buildingdevice_edit";
        }
    }

    @RequestMapping(value = "/buildingdevice/get/{id}", method = RequestMethod.POST)
    @ResponseBody
    private ExcelImporterBuildingDevice buildingdeviceGet(@PathVariable("id") String id) {
        return baseService.get(ExcelImporterBuildingDevice.class, id);
    }

    @RequestMapping(value = "/buildingdevice/save", method = RequestMethod.POST)
    @ResponseBody
    public Result buildingdeviceSave(ExcelImporterBuildingDevice obj) {
        if (StrUtil.isEmpty(obj.getId())) {
            obj.setCreateDateTime(new Date());
            obj.setUpdateDateTime(new Date());
            obj.setDeleted(0);
            obj.setVersion(0);
            obj.setUserId(SecurityUtil.getUserId());
            baseService.save(obj);
        } else {
            ExcelImporterBuildingDevice buildingdevice = baseService.get(ExcelImporterBuildingDevice.class, obj.getId());
            buildingdevice.setUpdateDateTime(new Date());
            buildingdevice.setUserId(SecurityUtil.getUserId());
            buildingdevice.setSheetName(obj.getSheetName());
            buildingdevice.setLocation(obj.getLocation());
            buildingdevice.setDevicenameOrObjectname(obj.getDevicenameOrObjectname());
            buildingdevice.setDeviceidOrObjectid(obj.getDeviceidOrObjectid());
            buildingdevice.setObjectType(obj.getObjectType());
            baseService.update(buildingdevice);
        }
        return new Result();
    }

    @RequestMapping(value = "/buildingdevice/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    private Result buildingdeviceDelete(@PathVariable("id") String id) {
        ExcelImporterBuildingDevice camera = baseService.get(ExcelImporterBuildingDevice.class, id);
        try {
            baseService.delete(camera);
        }
        catch (Exception e) {
            return new Result(false);
        }

        return new Result(true);
    }

    @Resource
    private BaseService baseService;


    /**
     * 获取合并单元格的Cell
     * @param sheet
     * @param row
     * @param column
     * @return
     */
    public static Cell getMergedRegionValue(Sheet sheet, int row, int column) {
        int sheetMergeCount = sheet.getNumMergedRegions();

        for (int i = 0; i < sheetMergeCount; i++) {
            CellRangeAddress ca = sheet.getMergedRegion(i);
            int firstColumn = ca.getFirstColumn();
            int lastColumn = ca.getLastColumn();
            int firstRow = ca.getFirstRow();
            int lastRow = ca.getLastRow();

            if (row >= firstRow && row <= lastRow) {

                if (column >= firstColumn && column <= lastColumn) {
                    Row fRow = sheet.getRow(firstRow);
                    return fRow.getCell(firstColumn);
                }
            }
        }

        return sheet.getRow(row).getCell(column);
    }

    private static Logger logger = Logger.getLogger(ExcelImporterController.class);
}
