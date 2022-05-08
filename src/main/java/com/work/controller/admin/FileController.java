package com.work.controller.admin;

import com.alibaba.fastjson.JSON;
import com.work.utils.SystemConstant;
import com.work.utils.UUIDUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/admin/file")
public class FileController {

    @RequestMapping("/uploadFile")
    public String uploadFile(MultipartFile file) {
        Map<String, Object> map = new HashMap<>();
        if (!file.isEmpty()) {
            String oldName = file.getOriginalFilename();
            String extension = FilenameUtils.getExtension(oldName);
            String newName = UUIDUtils.randomUUID() + "." + extension;
            File dest = new File(SystemConstant.PATH, newName);

            try {
                file.transferTo(dest);
                map.put("code", 0);
                map.put("msg", "success");
                Map<String, Object> sub = new HashMap<>();
                sub.put("src", SystemConstant.ECHO + "/" + newName);
                sub.put("imgPath", newName);
                map.put("data", sub);

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return JSON.toJSONString(map);
    }
}
