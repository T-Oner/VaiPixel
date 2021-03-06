package com.emrys.vaipixel.db.mapper;

import com.emrys.vaipixel.db.enums.WorkTypeEnum;
import com.emrys.vaipixel.db.model.Work;
import com.emrys.vaipixel.dto.cond.WorkCond;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface WorkMapper {

    @Select("SELECT work.id, title, description, created_time, updated_time, width, height, type, large_url, " +
            "medium_url, small_url, thumb_url, author_id, category_id, like_count, page_view, user_view " +
            "FROM t_work AS work " +
            "LEFT JOIN t_photo ON t_photo.work_id = work.id " +
            "LEFT JOIN t_video ON t_video.work_id = work.id ")
    @ResultMap("com.emrys.vaipixel.db.mapper.WorkMapper.WorkResultMap")
    List<Work> getWorks();

    @Select("SELECT work.id, title, description, created_time, updated_time, width, height, type, large_url, " +
            "medium_url, small_url, thumb_url, author_id, category_id, like_count, page_view, user_view, " +
            "camera_make, camera_model, lens, focal_length, aperture, iso, shutter, device_name, play_url " +
            "FROM t_work AS work " +
            "LEFT JOIN t_photo ON t_photo.work_id = work.id " +
            "LEFT JOIN t_video ON t_video.work_id = work.id " +
            "WHERE work.id = #{workId}")
    @ResultMap("com.emrys.vaipixel.db.mapper.WorkMapper.WorkResultMap")
    Work getWorkById(long workId);

    @Select("SELECT work.id, title, description, created_time, updated_time, width, height, type, large_url, " +
            "medium_url, small_url, thumb_url, author_id, category_id, like_count, page_view, user_view, " +
            "camera_make, camera_model, lens, focal_length, aperture, iso, shutter, device_name, play_url " +
            "FROM t_work AS work " +
            "LEFT JOIN t_photo ON t_photo.work_id = work.id " +
            "LEFT JOIN t_video ON t_video.work_id = work.id " +
            "WHERE work.id = #{workId} AND type = #{type}")
    @ResultMap("com.emrys.vaipixel.db.mapper.WorkMapper.WorkResultMap")
    Work getWorkByIdAndType(long workId, WorkTypeEnum type);

    List<Work> getWorksByCond(WorkCond cond);

    @Insert("INSERT INTO t_work(id, title, description, width, height, type, large_url, medium_url, small_url, " +
            "thumb_url, category_id, author_id) " +
            "VALUES " +
            "(#{id}, #{title}, #{description}, #{width}, #{height}, #{type}, #{image.largeUrl}, #{image.mediumUrl}, " +
            "#{image.smallUrl}, #{image.thumbUrl}, #{category.id}, #{author.id})")
    void insertWork(Work work);

    @Delete("DELETE FROM t_work WHERE work_id = #{id}")
    void deleteWorkById(long id);

}
