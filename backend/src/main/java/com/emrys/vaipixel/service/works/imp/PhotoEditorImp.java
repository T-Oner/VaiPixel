package com.emrys.vaipixel.service.works.imp;

import com.emrys.vaipixel.db.dao.work.IWorkDao;
import com.emrys.vaipixel.db.model.Photo;
import com.emrys.vaipixel.service.works.IWorkEditor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PhotoEditorImp implements IWorkEditor<Photo> {

    private IWorkDao workDao;

    @Autowired
    public void setWorkDao(IWorkDao workDao) {
        this.workDao = workDao;
    }

    @Override
    public void addWork(Photo work) {
        workDao.addPhotoWork(work);
    }

    @Override
    public void updateWork(Photo work) {
    }
}
