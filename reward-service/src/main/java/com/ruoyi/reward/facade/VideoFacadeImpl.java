package com.ruoyi.reward.facade;

import com.alibaba.dubbo.config.annotation.Service;
import com.google.common.collect.Lists;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.reward.convert.VideoConvert;
import com.ruoyi.reward.facade.api.VideoFacade;
import com.ruoyi.reward.facade.dto.VideoDTO;

import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.domain.VideoExample;
import com.ruoyi.reward.mapper.ExtVideoMapper;
import com.ruoyi.reward.mapper.VideoMapper;
import com.ruoyi.reward.repository.VideoRepository;
import org.near.servicesupport.result.ResultBuilder;
import org.near.servicesupport.result.TPageResult;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;


/**
 * 公共片库Service业务层处理
 *
 * @author ruoyi
 * @date 2020-03-17
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class VideoFacadeImpl implements VideoFacade {
    @Autowired
    private VideoMapper videoMapper;
    @Autowired
    VideoRepository videoRepository;
    @Autowired
    private ExtVideoMapper extVideoMapper;

    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    @Override
    public VideoDTO selectVideoDTOById(Long id) {
        Video shipin = extVideoMapper.selectVideoById(id);
        return VideoConvert.convert(shipin);

    }

    @Override
    public int updateClickPlus(Long id) {
        return extVideoMapper.updateClickPlus(id);
    }


    /**
     * 查询公共片库列表
     *
     * @param item 公共片库
     * @return 公共片库
     */
    @Override
    public List<VideoDTO> selectVideoDTOList(VideoDTO item) {
        Video it = new Video();
        BeanUtils.copyProperties(item, it);
        List<Video> list = extVideoMapper.selectVideoList(it);
        return list.stream().map(VideoConvert::convert).collect(Collectors.toList());

    }

    @Override
    public int count(VideoDTO item) {
        VideoExample example = new VideoExample();
        VideoExample.Criteria criteria = example.createCriteria();
        if (item.getId() != null) {
            criteria.andIdEqualTo(item.getId());
        }
        if (StringUtil.isNotBlank(item.getUserId())) {
            criteria.andUserIdEqualTo(item.getUserId());
        }
        long l = videoMapper.countByExample(example);
        return (int) l;
    }

    /**
     * 新增公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    @Override
    public int insertVideoDTO(VideoDTO item) {
        Video it = new Video();
        BeanUtils.copyProperties(item, it);
        return extVideoMapper.insertVideo(it);
    }

    /**
     * 修改公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    @Override
    public int updateVideoDTO(VideoDTO item) {
        Video it = new Video();
        BeanUtils.copyProperties(item, it);
        return extVideoMapper.updateVideo(it);
    }

    @Override
    public TPageResult<VideoDTO> queryPage(int start, int rows, VideoDTO videoDTO, String orderByClause) {
        int i = start > 1 ? (start - 1) * rows : 0;
        List<VideoDTO> list = videoRepository.queryPage(i, rows, videoDTO, orderByClause);
        if (CollectionUtils.isEmpty(list)) {
            return ResultBuilder.succTPage(Lists.newArrayList(), start, rows, 0);
        }
        long count = videoRepository.count(videoDTO);
        return ResultBuilder.succTPage(list, start, rows, (int) count);
    }

    /**
     * 删除公共片库对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteVideoDTOByIds(String ids) {
        return extVideoMapper.deleteVideoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除公共片库信息
     *
     * @param id 公共片库ID
     * @return 结果
     */
    @Override
    public int deleteVideoDTOById(Long id) {
        return extVideoMapper.deleteVideoById(id);
    }
}
