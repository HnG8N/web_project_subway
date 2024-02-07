var view = {
    init : function(frm){

    },

    view : function(id,path) {
        location.href="/menuView/"+ path +"?menuItemIdx=" + id;
    }
}
//메뉴소개 상세페이지 진입
function menuDetail(frm) {
    var id = $(frm).data("menuitemidx");
    var path = $(frm).data("category");

        view.view(id,path);
        return false;
}

$(document).ready(function(){
    view.init();

    //메뉴소개 관리 기능 추가로 인한 스크립트 통합
    $(window).load(function(){
        pdVisual_sandwich()
        pdVisual_wrap()
        pdVisual_salad()
        pdVisual_sidesDrink()
        pdVisual_catering()
        pdVisual_morning()
        pdTab_Sort()
    })
})