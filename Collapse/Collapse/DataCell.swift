//
//  DataCell.swift
//  Collapse
//
//  Created by nguyen gia huy on 08/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

struct CellData {
    var imgView = String()
    var title = String()
    var content = String()
    var stateCell = Bool()

    init(imgView: String,title:String,content: String,stateCell: Bool) {
        self.imgView = imgView
        self.title = title
        self.content = content
        self.stateCell = stateCell
        
    }
}
struct DataCell {
    static var share = DataCell()
    var data : [CellData] = [CellData(imgView: "img1.jpeg", title: "Cận cảnh: Toa tàu metro số 1 đã đến TP HCM", content: "(NLĐO) - Tàu metro số 1 vừa cập cảng Khánh Hội (TP HCM), sau đó sẽ được vận chuyển bằng xe siêu trường, siêu trọng về quận 9 Ngày 8-10, Ban quản lý đường sắt đô thị TP HCM (MAUR) đã tiếp nhận những toa tàu đầu tiên thuộc tuyến metro số 1 Bến Thành- Suối Tiên tại cảng Khánh Hội (quận 4)",stateCell: true),CellData(imgView: "img2.jpeg", title: "Mở sổ tiết kiệm gần 600 triệu đồng cho 3 cháu bé mất cả cha lẫn mẹ ở Sóc Trăng", content: "Từ các bài viết của Báo Người Lao Động về trường hợp của 3 cháu bé ở Sóc Trăng mất cả cha lẫn mẹ trong một vụ tai giao thông rất thương tâm, nhiều bạn đọc trong và ngoài nước đã thông qua Báo Người Lao Động ủng hộ 3 cháu bé số với số tiền lên đến hàng trăm triệu đồng.",stateCell: true),CellData(imgView: "img3.jpeg", title: "Quảng Nam nói gì về việc xe buýt bị cấm vào trung tâm Đà Nẵng ?", content: "UBND tỉnh Quảng Nam có văn bản đề nghị UBND TP.Đà Nẵng nghiên cứu, xem xét tạm dừng thực hiện việc cấm các tuyến xe buýt từ Quảng Nam vào trung tâm Đà Nẵng.",stateCell: true),CellData(imgView: "img1.jpeg", title: "Cận cảnh: Toa tàu metro số 1 đã đến TP HCM", content: "(NLĐO) - Tàu metro số 1 vừa cập cảng Khánh Hội (TP HCM), sau đó sẽ được vận chuyển bằng xe siêu trường, siêu trọng về quận 9 Ngày 8-10, Ban quản lý đường sắt đô thị TP HCM (MAUR) đã tiếp nhận những toa tàu đầu tiên thuộc tuyến metro số 1 Bến Thành- Suối Tiên tại cảng Khánh Hội (quận 4)",stateCell: true),CellData(imgView: "img2.jpeg", title: "Mở sổ tiết kiệm gần 600 triệu đồng cho 3 cháu bé mất cả cha lẫn mẹ ở Sóc Trăng", content: "Từ các bài viết của Báo Người Lao Động về trường hợp của 3 cháu bé ở Sóc Trăng mất cả cha lẫn mẹ trong một vụ tai giao thông rất thương tâm, nhiều bạn đọc trong và ngoài nước đã thông qua Báo Người Lao Động ủng hộ 3 cháu bé số với số tiền lên đến hàng trăm triệu đồng.",stateCell: true),CellData(imgView: "img3.jpeg", title: "Quảng Nam nói gì về việc xe buýt bị cấm vào trung tâm Đà Nẵng ?", content: "UBND tỉnh Quảng Nam có văn bản đề nghị UBND TP.Đà Nẵng nghiên cứu, xem xét tạm dừng thực hiện việc cấm các tuyến xe buýt từ Quảng Nam vào trung tâm Đà Nẵng.",stateCell: true),CellData(imgView: "img1.jpeg", title: "Cận cảnh: Toa tàu metro số 1 đã đến TP HCM", content: "(NLĐO) - Tàu metro số 1 vừa cập cảng Khánh Hội (TP HCM), sau đó sẽ được vận chuyển bằng xe siêu trường, siêu trọng về quận 9 Ngày 8-10, Ban quản lý đường sắt đô thị TP HCM (MAUR) đã tiếp nhận những toa tàu đầu tiên thuộc tuyến metro số 1 Bến Thành- Suối Tiên tại cảng Khánh Hội (quận 4)",stateCell: true),CellData(imgView: "img2.jpeg", title: "Mở sổ tiết kiệm gần 600 triệu đồng cho 3 cháu bé mất cả cha lẫn mẹ ở Sóc Trăng", content: "Từ các bài viết của Báo Người Lao Động về trường hợp của 3 cháu bé ở Sóc Trăng mất cả cha lẫn mẹ trong một vụ tai giao thông rất thương tâm, nhiều bạn đọc trong và ngoài nước đã thông qua Báo Người Lao Động ủng hộ 3 cháu bé số với số tiền lên đến hàng trăm triệu đồng.",stateCell: true),CellData(imgView: "img3.jpeg", title: "Quảng Nam nói gì về việc xe buýt bị cấm vào trung tâm Đà Nẵng ?", content: "UBND tỉnh Quảng Nam có văn bản đề nghị UBND TP.Đà Nẵng nghiên cứu, xem xét tạm dừng thực hiện việc cấm các tuyến xe buýt từ Quảng Nam vào trung tâm Đà Nẵng.",stateCell: true)]
    
}

