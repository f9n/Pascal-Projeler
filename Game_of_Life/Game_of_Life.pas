program game_of_life;
Uses Crt;
Var j_matris:Array[1..30,1..30,1..30] of integer;
    {*matris:Array[1..30,1..30] of integer;
    y_matris:Array[1..30,1..30] of integer;*}
    i,j,a,satir,sutun,k,j_sayisi:integer;
    
Begin
   Clrscr;
       gotoxy(20,1); Writeln('*** Game Of Live ***');
       gotoxy(20,2); Writeln('oyununa,Hosgeldiniz');  
       gotoxy(20,3); Writeln('Devam etmek icin bir tusa basin...');Readln;
       Clrscr;
             {*  Window(1,1,50,50); *} 
             Textcolor(4);
             {*  Textbackground();  *}
             for i:=1 to 20 do begin Write('-'); end;
             Write('GAME---OF---LİVE');
             for i:=1 to 20 do begin Write('-'); end;
             Textcolor(2);
       gotoxy(10,2);Writeln('Lutfen bekleyin oyun yukleniyor.....');
       for i:=1 to 2 do begin
                        gotoxy(42,2);Write('.     ');DELAY(1000);
                        gotoxy(42,2);Write('..    ');DELAY(1000);
                        gotoxy(42,2);Write('...   ');DELAY(1000);
                        gotoxy(42,2);Write('....  ');DELAY(1000);
                        gotoxy(42,2);Write('..... ');DELAY(1000);
                        end;
       Writeln;           
       Writeln('Belli alanlarda Yasayan mikroorganizmalari tanimlayiniz. ');
       Write('Matrisinizin satirinizi giriniz:');Readln(satir);
       Write('Matrisinizin sutununu giriniz:');Readln(sutun);
       Write('Kac jenerasyon ilerlesin:');Readln(j_sayisi);   {*İlerki kisimda jenerasyon sayisini kullanicam.*}
         
{*--------------------------------------------------------------------------------------------*}
   {*Yukarda oyunun basi gosterildi.Ve matrisinin buyuklukleri alindi.*}     
{*--------------------------------------------------------------------------------------------*}

   for i:=1 to 30 do begin
                     Write('-');
                     end;
   Writeln; 
   for i:=1 to satir do begin
                     for j:=1 to sutun do begin
                                         Write('Matrisiniz ',i,'x',j,' yerde mikroorganizma yasiyorsa 1 e degilse 0 kodlayiniz:'); Read(j_matris[1][i][j]);
                                       end;  
                     end;
{*--------------------------------------------------------------------------------------------*}
   {*2.ci kisimda matrisinin elemanlari alindi.Yasiyorsa 1 yoksa 0 kodlandi.*}
{*--------------------------------------------------------------------------------------------*}
   Clrscr;
   Writeln('Asil matris...');       
   for i:=1 to 2*sutun+3  do begin
                         Write('-');
                         end;
    Writeln;

   for i:=1 to satir do begin
                     Write('|.');
                     for j:=1 to sutun do begin
                                      if j_matris[1][i][j]=1 then begin
                                                             Write('x.');
                                                             end
                                                        else begin
                                                             Write('-.');
                                                             end; 
                                          end;
                     Write('|');
                     Writeln; 
                    end;
  for i:=1 to 2*sutun+3  do begin
                        Write('-');
                        end;
   Writeln;;
   Readln;
{*--------------------------------------------------------------------------------------------*}
   {*3.cu kisimda matris ekranda gosterildi.*}
{*--------------------------------------------------------------------------------------------*}
    Readln;
   {*Clrscr;*}
   a:=1;
   while a<j_sayisi+1 do  begin 
         for i:=1 to satir do begin
                      for j:=1 to sutun do begin
                                           k:=0;
                                           {*Ust Komsular*}
                                           if i=1 then begin
                                                       end                         
                                                  else begin
                                                       if j=1 then begin
                                                                   if j_matris[a][i-1][j]  =1 then begin k+=1; end;
                                                                   if j_matris[a][i-1][j+1]=1 then begin k+=1; end;  
                                                                   end
                                                              else begin
                                                                   if j=sutun then begin 
                                                                               if j_matris[a][i-1][j]  =1 then begin k+=1; end;
                                                                               if j_matris[a][i-1][j-1]=1 then begin k+=1; end;
                                                                               end
                                                                          else begin 
									       if j_matris[a][i-1][j-1] =1 then begin k+=1; end;
                                                                               if j_matris[a][i-1][j]   =1 then begin k+=1; end;
 									       if j_matris[a][i-1][j+1] =1 then begin k+=1; end;	 
                                                                               end;
                                                                   end;                               
                                                       end;
                                           {*Yan Komsular*}
 					   if j=1 then begin
                                                       if j_matris[a][i][j+1]=1 then k+=1;
                                                       end
                                                  else begin
                                                       if j=sutun then begin
                                                                       if j_matris[a][i][j-1]=1 then k+=1;
                                                                       end
                                                              else begin
                                                                   if j_matris[a][i][j+1]=1 then k+=1;
							           if j_matris[a][i][j-1]=1 then k+=1;
                                                                   end;
                                                       end; 			    
                                            {*Alt komsular*}
  					    if i=satir then begin end
                                                       else begin
                                                            if j=sutun then begin
 								            if j_matris[a][i+1][j]  =1 then k+=1;
                                                                            if j_matris[a][i+1][j-1]=1 then k+=1;
                                                                            end
                                                                        else begin
                                                                             if j=1 then begin
                                                                                	 if j_matris[a][i+1][j]  =1 then k+=1;
        										 if j_matris[a][i+1][j+1]=1 then k+=1;
                                                                                	 end
                                                                                    else begin 
                                                                                	 if j_matris[a][i+1][j-1]=1 then k+=1;
     											 if j_matris[a][i+1][j]  =1 then k+=1;
                                                                                	 if j_matris[a][i+1][j+1]=1 then k+=1; 
                                                                                         end;
                                                                    	     end;                                 
                                                            end;
{*4.cu kisimda k degeri tek tek artirildi.*}
{*-------------------------------------------------------------------------------------------*}                                   
                                             {*Sonuc*}

                                             if j_matris[a][i][j]=1 then begin
							            if (k>3) OR (k<2)  then begin j_matris[a+1][i][j]:=2; end
                                                                                       else begin j_matris[a+1][i][j]:=1; end;		
                                                                    end
            {*Matirisin 0 oldugu durum veya olmus*}            else begin
								    if k=3 then begin j_matris[a+1][i][j]:=1; end
                                                                           else begin 
                                                                                if j_matris[a][i][j]=0 then begin j_matris[a+1][i][j]:=0; end
                                                                                                       else begin j_matris[a+1][i][j]:=2; end;    
                                                                                end;
                                                                    end;
                       {*matris degeri 1 ise 'x' yasiyordur;matris degeri 0 ise '-' bostur.matris degeri 2 ise 'o' olmustur.*}             
                                                                
                          end;{*2.ci for' un sonu*}
                   end;{*1.ci for'un sonu*}
         a+=1;
    end;{*while ' in sonu*}

{*--------3 dongu ic ice acarak butun matrisleri karsilastirdiktan sonra sonuc kısmı karsilatirmak---------*}

for a:=1 to j_sayisi do begin
                        writeln('************************************************');
                        Writeln('| ',a,'.ci jenerasyon yasayanlar,olenler ve boslar..|');
                        writeln('************************************************');
                        for i:=1 to 2*sutun+3  do begin
                                                  Write('~');
                         			  end;
   						  Writeln;
                        for i:=1 to satir do begin       				  		        
                                             Write('|.');
                     			     for j:=1 to sutun do begin
                                                                  if j_matris[a][i][j]=1 then begin
                                                                                              Write('x.');
                                                                                              end
                                                                			 else begin
                                                               				      if j_matris[a][i][j]=0 then begin Write('-.'); end
                                                                                                                     else begin Write('o.'); end;  
                                                                                              end;
                       						  end;
                                             Write('|');
                                             Writeln;
                   			     end;
                        for i:=1 to 2*sutun+3  do begin
                                                  Write('~');
                                                  end;
                        writeln;                                            
			end;
{*--------Ekrana yazdirma-----------------------------------------------------------------------*}
   Writeln;

   Readln;    
End.
{* 1. Ölüm : Eğer bir organzimanın  sıfır veya bir komşusu varsa yalnızlıktan, üçten fazla komşusu varsa kalabalıktan dolayı  ölür. 
   2. Doğum : Eğer boş bir hücrenin üç tane yaşayan komşusu varsa, boş hücrede yeni bir organizma doğar.  
   3. Yaşamaya devam :  Canlı bir organizmanın iki veya üç adet canlı komşusu varsa, organizma yaşamaya devam eder. 
  --Game of Life asagidaki kosullardan biri saglanmissa sona erer;
         1-Butun organizmalara olmusse
         2-Ardısık iki jenerasyonda organizmalarin hepsinin durumu ayni kaldiysa
         3-Bazen HAYAT dongusu osilasyona girebilir.Yani bir jenerasyon iki onceki
        jenerasyonun tamamen aynısı olur ve yasam donugusu ileri-geri dogru ayni 
        sekilde tekrarlanirsa.
         4- Kullanıcı tarafından giriş bilgisi olarak verilen sayıda jenerasyon tamamlandı ise
  --Giriş Bilgileri :
   1. HAYAT matrisinin satır ve sütun sayısını ve oyunun bitmesi için yukarıda verilen 4. şart olan maksimum jenerasyon sayısını kullanıcıdan alınız.  
   2. HAYAT matrisini okuyarak ilk jenerasyonda hangi adreslerde yaşayan organizmalar  olduğu bilgisini kullanıcıdan alınız.
   3. Her jenerasyon sonunda HAYAT  matrisinin ekrana yazdırılıp yazdırılmayacağını kullanıcıya sorunuz. 
  --Çıkış Bilgileri :
   1. Matrisi ekrana yazdırırken yaşayan hücreleri x, ölü hücreleri o, boş hücreleri – ile gösteriniz.  
   2. Her jenerasyon sonunda durumun ekranda gösterilmesi istendiyse, her jenerasyon sonundaki durumu ekrana yazdırınız. 
   3. Her jenerasyon sonunda durumun ekranda gösterilmesi istenmediyse, sadece ilk  3 jenerasyonu ve son 3 jenerasyonu gösteren matrisleri ekrana yazdırınız. 
   4. Oyunun kaç jenerasyon sürdüğünü ve oyunun bitme sebebini  ekrana yazdırınız.

*}
