local sx, sy = guiGetScreenSize()
local g, u = 350, 300
local x, y = (sx-g)/2, (sy-u)/2

sorulart = { -- Soruların olduğu tablo
 -- "Soru"
}

answersofasks = { -- Cevapların olduğu tablo
 -- "Cevap"
}

win = guiCreateWindow(x, y, g, u, "Sıkça Sorulan Sorular", false)
gridlist = guiCreateGridList(10, 25, 330, 150, false, win)
sorular = guiGridListAddColumn(gridlist, "Sorular", 0.95)
cevap = guiCreateLabel(15, 180, g, u, "", false, win)
guiSetFont(cevap, "default-bold-small")
guiGridListSetSelectionMode(gridlist, 0)

guiGridListClear(gridlist)
for i, v in ipairs(sorulart) do -- Tablo döngüye sokuldu
   row = guiGridListAddRow(gridlist) -- Gridlist'e row eklendi
   guiGridListSetItemText(gridlist,row,sorular,v,false,false) -- Eklenilen row düzenlendi
   guiGridListSetItemData(gridlist,row,sorular,i) -- Eklenilen row'un datası tablolar ile eşitlendi. bu sayede oyuncu row'a tıklandığında cevaplar tablosundan doğru cevap alınabilecek
   print("sorular eklendi") -- bu direk outputDebugString işlevi görür
end

addEventHandler("onClientGUIClick", getRootElement(), function()
   if (source == gridlist) then -- Burada oyuncunun SSS gridlist'ine tıkladığı kontrol edildi. eğer bu if koşulu olmazsa oyuncu başka bir pencerede olduğunda da alttaki kodlar çalışacak. bu if koşulu ile bunu engelliyor ve 2-3KB'ta olsa RAM'i doldurmaktan kaçınıyoruz
      local selectedRow = guiGridListGetSelectedItem(gridlist) -- Oyuncunun seçtiği row alındı
      local selectedRowData = guiGridListGetItemData(gridlist, selectedRow, sorular) -- Seçilen row'un sırası alındı bu sayede cevaplar tablosundan doğru cevabı bulabileceğiz
      for i, v in ipairs(answersofasks) do -- cevaplar tablosu döngüye sokuldu
         if (i == selectedRowData) then -- seçilen row'un sırası cevaplar tablosundakilerin sırası ile karşılaştırıldı. eğer eşleşme bulunursa cevap yazdırılacak
            guiSetText(cevap, answersofasks[selectedRowData]) -- burada tablodan index ile veri çekildi
         end
      end
   end
end)