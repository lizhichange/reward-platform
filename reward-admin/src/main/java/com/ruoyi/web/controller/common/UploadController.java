package com.ruoyi.web.controller.common;

import com.google.common.util.concurrent.ThreadFactoryBuilder;
import com.ruoyi.common.core.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.*;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/system/upload")
public class UploadController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UploadController.class);

    /**
     * The Named thread factory.
     */
    private ThreadFactory namedThreadFactory = new ThreadFactoryBuilder()
            .setNameFormat("UploadController.-pool-%d").build();
    /**
     * Common Thread Pool
     */


    private ExecutorService pool;

    private String prefix = "system/upload";


    @PostConstruct
    void init() {
        pool = new ThreadPoolExecutor(100, 200,
                0L, TimeUnit.MILLISECONDS,
                new LinkedBlockingQueue<>(1024), namedThreadFactory, new ThreadPoolExecutor.AbortPolicy());


    }


    /**
     * new annotation since 4.3
     *
     * @param files              the files
     * @param redirectAttributes the redirect attributes
     * @return the string
     * @throws IOException the io exception
     */
    @PostMapping("/upload")
    @ResponseBody
    public String singleFileUpload(@RequestParam("file") List<MultipartFile> files,
                                   RedirectAttributes redirectAttributes) throws IOException {

        if (files.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:uploadStatus";
        }

        return "suc";
    }


    @PreDestroy
    void destroy() {
        if (pool != null) {
            pool.shutdown();
        }
    }


    @GetMapping()
    public String upload() {
        return prefix + "/index";
    }

}
