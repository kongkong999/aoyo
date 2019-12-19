package spring.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import spring.dao.SurgeryMapper;
import spring.pojo.*;
import spring.pojo.utils.Page;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SurgeryService {
    @Resource
    SurgeryMapper surgeryMapper;

    /*展示手术单and备货单*/
    public PageInfo<Surgicaldrape> ShowSurgery(Page page, String date_1, String date_2) {
        PageHelper.offsetPage(page.getOffset(), page.getLimit());
        List<Surgicaldrape> surgicaldrapes = surgeryMapper.ShowSurgery(date_1, date_2);
        PageInfo<Surgicaldrape> pageInfo = new PageInfo<>(surgicaldrapes);
        return pageInfo;
    }

    /*手术单详情and备货单详情*/
    public List<SurgicaldrapeDetails> SurgeryParticulars(Integer id) {
        return surgeryMapper.SurgeryParticulars(id);
    }

    /*改变状态*/
    public void Sign(Integer id, Integer q) {
        /*改变状态*/
        surgeryMapper.Sign(id, q);
        /*添加日志*/
        surgeryMapper.log();
    }

    /*添加回执单*/
    public void AddSurgery(List<Receipt> list) {
        surgeryMapper.AddSurgery(list);
    }

    /*填单__备货单__手术单__添加*/
    public void AddSurgeryOrder(List<SurgicaldrapeDetails> list, Surgicaldrape sur) {
        /*填单__备货单__手术单__添加*/
        surgeryMapper.AddSurgeryOrder(sur);
        long id = sur.getId();
        /*添加备详情*/
        surgeryMapper.AddSurgeryOrder1(list, id);
    }

    /*回执单查询*/
    public List<Receipt> showReceipts(Integer id) {
        return surgeryMapper.showReceipts(id);
    }

    /*填单__委托加工单__添加*/
    public void AddManufacturing(List<Consignedprocessing> list, Consignedprocessings con) {
        surgeryMapper.AddManufacturing(list, con);
    }

    /*零件库__全查*/
    public PageInfo<Consignedprocessing> CommissionedProcessing(Page page, String date_1, String date_2) {
        PageHelper.offsetPage(page.getOffset(), page.getLimit());
        List<Consignedprocessing> surgicaldrapes = surgeryMapper.CommissionedProcessing(date_1, date_2);
        PageInfo<Consignedprocessing> pageInfo = new PageInfo<>(surgicaldrapes);
        return pageInfo;
    }

    /*内容表的查询*/
    public List<TableContents> TableContents(Integer id) {
        return surgeryMapper.TableContents(id);
    }

    /*内容表全查*/
    public List<FinishedProduct> finishedProduct() {
        return surgeryMapper.finishedProduct();
    }

    /*新建表__添加*/
    public void NewTable(List<TableContents> list, String namee) {
        TableContents tableContents = new TableContents();
        tableContents.setName(namee);
        /*添加新建表*/
        surgeryMapper.NewTable(tableContents);
        /*添加详情*/
        surgeryMapper.NewTable1(list, tableContents.getId());
    }
}
