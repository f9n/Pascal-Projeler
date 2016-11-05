{Programin tek sikintisi kullanicidan 1 lerin yerini sirali şekilde almak istemesi:}
program semester_project;
Uses Crt,DateUtils,sysutils;
Var  oyun_oynamak:integer;{Oyunun tekrar oynana bilecegi while}
     tekrar_oynamak:integer;{Kullanicidan tekrardan oynamak icin alinan deger}
     kelime,kelime_2:string;{starting game}
     q:string;{starting game }
     a:byte;
     u_name:String;
     length,width,tcell,time:integer;{*All the input parameters*}
     u_point:integer; 
     student:integer;
     i,j,m,n:integer; {loops}
     k:integer;
     Joker:byte;
     Tmp:integer;
     Tmp_string:String;
     x:integer;{random number}
     toplam_oyuncu:Array[1..5] of String;
     toplam_oyuncu_puani:Array[1..5] of integer;
     satir_arama:integer;{tcell yerlerini bulmaya çalişan değişken}
     satir_dizisi:Array[1..4] of integer;{Ayni degeri girince patlamasin diye olusturulan dizi}
     satir_matrisi:Array[1..3,1..16] of integer;{tcell yerlerini tutan dizi}
     raceway  :Array[1..10,1..16] of Char;{asil dizi}
     raceway_2:Array[1..10,1..16] of Char;{yedek dizi içinde '*' lar var.}
     FromTime,ToTime:TDateTime;
     DiffSeconds:integer;
Procedure Starting_Game;
    BEGIN
    {Kullaniciya oyunun basladigi gösterilir.}
    kelime:='Starting the Memory Game'; 
    for i:=1 to 4 do begin
       		     q:='';
    		     a:=1;   
    		     while  a<25  do begin 
                    			Clrscr;
                    			kelime_2:=kelime;
		    			kelime_2[a]:=Upcase(kelime_2[a]);             
	            			CASE a mod 3 OF
                         		0:q:='/';
                         		1:q:='-';
                         		2:q:='\';
                         		else ; 
		    			end;{Case Of'un end'i}
		    			Write('[+] ',kelime_2,'...',q);Delay(100);
                    			a+=1;
                    			end;{while'in end'i}
                    end;{for'un end'i}
    END;
Procedure Input_Parameters;
    BEGIN
    {*Kullanicidan İsmi,Matrisin büyüklükleri ve 1 sütün daki 1 değerini kaç tane olacağini ve zamani al. *}
    Clrscr;
    Joker:=1;
    a:=1;
    While a=1 do begin 
                 Write('The name of the user:');Readln(u_name);
                 if oyun_oynamak>1 then begin 
					k:=1;
				        for i:=1 to oyun_oynamak-1 do begin 
								      if toplam_oyuncu[i]=u_name then begin 
												      a:=1;Write('Lutfen bir kere kullanilan oyuncu ismini tekrardan girmeyiniz:');Writeln; 
												      end
												 else begin a:=2; end;    
								      end;
					end
                                   else begin a:=2; end;
                 end;
    Clrscr;
    a:=1;
    While a=1 do begin
                 Writeln('The name of the user:',u_name);   	
    		 Write('The number of columns:');Readln(length);
                 if (length<=16) And (length>=10) then a:=0
                                                  else begin Clrscr;Writeln('Please put 10<=(the number of columns)<=16 '); end;
                 end;
    Clrscr;
    a:=1;
    While a=1 do begin
                 Writeln('The name of the user:',u_name);
                 Writeln('The number of columns:',length); 
                 Write('The number of rows:');Readln(width);
                 if (width<=10) And (width>=6) then a:=0
					       else begin Clrscr;Writeln('Please put 6<=(the number of rows)<=10'); end; 
    		 end;
    Clrscr;
    a:=1;
    While a=1 do begin
                 Writeln('The name of the user:',u_name);
                 Writeln('The number of columns:',length);
                 Writeln('The number of rows:',width);
                 Write('The number of transition cell at one column:');Readln(tcell);
                 if (tcell<=3) And (tcell>=1) then a:=0
                                              else begin Clrscr;Writeln('Please put 1<=(transition cell at one column)<=3 '); end;
                 end;
    Clrscr;
    a:=1;
    While a=1 do begin
                 Writeln('The name of the user:',u_name);
                 Writeln('The number of columns:',length);
                 Writeln('The number of rows:',width);
                 Writeln('The number of transition cell at one column:',tcell);
                 Write('The board will be displayed for time seconds:');Readln(time);
                 if (time<=60) And (time>=10) then a:=0
                                               else begin Clrscr; Writeln('Please put 10<=(Time)<=60 '); end;
                 end;
   Clrscr;
   Writeln('The name of the user:',u_name);
   Writeln('The number of columns:',length);
   Writeln('The number of rows:',width);
   Writeln('The number of transition cell at one column:',tcell);
   Writeln('the board will be displayed for time seconds:',time);    
   END;  {prosedure ait end}  
   {Kullanicidan genel bilgiler alindi.Artik kullanicin içinde '1' bulan matrisini üretmek kaldi.}
Procedure Do_Matrix;
   BEGIN
   {*Matris Üretilir.*}
   for j:=1 to length do begin 
                         for i:=1 to width do begin raceway[i][j]:='0';raceway_2[i][j]:='*'; end;{asil matris '0' larla yedek matris '*' larla doldurulur.}
                         for i:=1 to tcell do begin satir_matrisi[i][j]:=0; end;{tcell yerlerini tutan dizi,her sutun icin ayri ayri}               
                         end;
   Randomize;
   for j:=1 to length do begin
            		 Tmp:=0;
		         while Tmp<tcell do begin{Tmp tcell degeri olana kadar doner.}
                                            a:=0;
					    x:=Random(width)+1;
					    for i:=1 to tcell do begin
							         if x=satir_matrisi[i][j] then
									                  else begin a+=1; end;
							         end;
                                            if a=tcell then begin Tmp+=1;raceway[x][j]:='1';satir_matrisi[Tmp][j]:=x;  end;
                                            end;{while'in end'i}
			 end;{for'un end'i}
    END;{Do_Matrix fonksiyonun sonu}
Procedure Sort_satir_matrisi;
    BEGIN
    {satir_matrisi siralanir.}
{Bubble Sort}
    for j:=1 to length do begin 
                        for i:=1 to tcell-1 do begin
                      			       for n:=1 to tcell-i do begin 
			                                              if satir_matrisi[n][j]>satir_matrisi[n+1][j] then begin 
											              			Tmp:=satir_matrisi[n][j];
					      								 		satir_matrisi[n][j]:=satir_matrisi[n+1][j];
					      						 				satir_matrisi[n+1][j]:=Tmp;				
												      			end;
								      end;
					      end;
                        end;{for'un end'i}
   END;{Sort_satir_matrisi fonksiyonun end'i}
Procedure Show_Real_Matrix;
   BEGIN
    {*Oyunun baslamasi ve asil matris elemanlari belli sure gosterilir.*}
    {*Matrisin elemanlari belli zaman gosterilir.*}
    for i:=1 to length do  begin
                           gotoxy(3*i+2,1);Write(i);
                           gotoxy(3*i+2,2);Write('=');
                           for j:=1 to width do begin
                                                    gotoxy(1,j+2);Write(j);
                                                    gotoxy(3,j+2);Write('|');			    
                                                    gotoxy(3*i+2,j+2);Write(raceway[j][i]);
                                                end;
                           end;
   END;
Procedure Show_Fake_Matrix;
   BEGIN
   {*Sahte matris gösterilir.(*) larla dolu olan.*}
   {*Oyunun icinde kontrol etmeler*}
   {for i:=1 to tcell do begin satir_dizisi[i]:=0; end;}{Gerekirse bu yazilir zaten üzerine değer aticaz.Yani yazmamiza gerek yok.}
		 for i:=1 to length do begin
                                       gotoxy(3*i+2,1);Write(i);
                                       gotoxy(3*i+2,2);Write('=');
                                       for j:=1 to width do begin
					                    gotoxy(1,j+2);Write(j);
							    gotoxy(3,j+2);Write('|');
                                                            gotoxy(3*i+2,j+2);Write(raceway_2[j][i]);
                                                            end;
                                       end;
                 
   END;{Show_Fake_Matrix in end'i}
 Procedure Show_Score;
   BEGIN
   toplam_oyuncu[oyun_oynamak]:=u_name;
   toplam_oyuncu_puani[oyun_oynamak]:=length+width+u_point)/DiffSeconds);
   for i:=1 to oyun_oynamak do begin 
                               for j:=1 to oyun_oynamak-1 do begin
			                                     if toplam_oyuncu_puani[j+1]>toplam_oyuncu_puani[j] then begin 
			                                               Tmp:=toplam_oyuncu_puani[j];                      Tmp_string:=toplam_oyuncu[j];
					      	                       toplam_oyuncu_puani[j]:=toplam_oyuncu_puani[j+1]; toplam_oyuncu[j]:=toplam_oyuncu[j+1];
					      			       toplam_oyuncu_puani[j+1]:=Tmp;		         toplam_oyuncu[j+1]:=Tmp_string;		
								                                                     end;			      			         
				            	             end;
                               end;{for'un end'i}
   Clrscr;
   Writeln('###Score Tablosu###');
   for i:=1 to oyun_oynamak do begin 
                               Gotoxy(1,2);Write('Sira');
                               Gotoxy(7,2);Write('Oyuncu');
                               Gotoxy(15,2);Write('Puani');
                               Gotoxy(1,i+2);Write(i);
                               Gotoxy(7,i+2);Write(toplam_oyuncu[i]);
                               Gotoxy(15,i+2);Write(toplam_oyuncu_puani[i]);
			       end;
   END;{Show_Score fonksiyon'un end'i}
{********************************************************************************************** ANA PROGRAM ***************************************************************************************************}
Begin
   oyun_oynamak:=1;
   Starting_Game;
   While oyun_oynamak<5 do begin
   Input_Parameters;
   Do_Matrix;
   Sort_satir_matrisi;
   Clrscr;
   Write('Oyun Basmasi icin herhangi bir tusa basin:');Readln;
   Clrscr;
   Show_Real_Matrix;
   Delay(time*1000);Clrscr;{the board will be displayed for t(time) seconds}
   FromTime:=Now;
   m:=1;u_point:=0;
   for i:=1 to 4 do begin satir_dizisi[i]:=0; end;
   while m<length+1 do begin   
                       Tmp:=1;k:=0;
                       while Tmp<tcell+1 do begin
			            Clrscr;
                                    Show_Fake_Matrix;
                                    Writeln;
                                    Write(m,'.ci sutun da bulunan 1 elemanlarinin bulundugu satirlarin sirali bir sekilde no:<99 girerse Joker hakkini kullanirsin>');Readln(satir_arama);
                                    if (satir_arama=99) And (Joker=1) then begin 
									   Tmp+=1;
									   k+=1;
									   Joker:=0;
									   end
                                                                      else begin
                                                                           {Kullanici tekrar bir deger girdiginda dizi de arandi.}
									   {Burda ayni sayi girinizce patlamasin diye dizide arandi.}
                                                                           for i:=1 to Tmp do begin
 											      if satir_dizisi[i]=satir_arama then begin Tmp:=49; end
															      else begin  end;
                                                                                              end;
                                                                           if Tmp=49 then begin Writeln('Ayni degeri girdigin icin kaybettin');m:=2*length; j:=1 Readln; end
 										     else begin 
											  j:=0;      
                                                                                              if raceway[satir_arama][m]='1' then begin
	                                                                                                     		      k+=1;
 															      satir_dizisi[k]:=satir_arama;
                                                                           			                              Tmp+=1;
					                                   			                              end
                                                                      				          		 else begin
                                                                           			                              Tmp:=49;
                                                                           			                              end;
                                                                                           end;
                                                                           end;
                                     if Tmp=49 then begin
						if j=0 then begin 
                                     		    if k>0 then begin 
 			                    			for i:=1 to satir_matrisi[k][m] do begin raceway_2[i][m]:='0' end;
                                            			for i:=1 to k do begin 
                                                             			raceway_2[satir_matrisi[i][m]][m]:='1';
                                                             			 end;  
                                                                 end
                                                            else begin end;   
                               		             m:=2*length;
     		                	             end
                          	 		else begin
						     if k=3 then begin  
							         for i:=1 to width do begin raceway_2[i][m]:='0' end; 
			       			                 for i:=1 to k do begin 
                                                             	                  raceway_2[satir_matrisi[i][m]][m]:='1';
                                                             	                  end;
								 end
  							    else begin
						      	         for i:=1 to satir_matrisi[k][m] do begin raceway_2[i][m]:='0' end; 
			       			                 for i:=1 to k do begin 
                                                             	                  raceway_2[satir_matrisi[i][m]][m]:='1';
                                                             	                  end;
							         end;  
		               	      		      end;
	                            
                                         end;{2.while'in end'i}
                        m+=1;
 		        u_point+=k;
                        end;{while'un end'i}
   Clrscr;
   Show_Fake_Matrix;
   ToTime:=Now;
   DiffSeconds:=SecondsBetween(ToTime,FromTime);
   Writeln;
   if m=length then begin Writeln('Hepsini dogru bildiniz.'); end
               else begin Writeln('Hayir hayir olamaz.'); end;
   Writeln('Toplam Puaniniz:',(length+width+u_point)/DiffSeconds:0:0);
   Writeln('Time: ',DiffSeconds);
   Write('Score tablosunu gormek istiyorsaniz bir tusa basin.');Readln;
   Clrscr;
   Show_Score;
   Writeln;
   Write('Tekrar oynamak ister misiniz?Oynamak istiyorsaniz 1 e basin:');Readln(tekrar_oynamak);
   if tekrar_oynamak=1 then begin 
                            oyun_oynamak+=1;
			    end
		       else begin 
			    oyun_oynamak:=5;
			    end;
   end;{Genel While'in end'i}
   Writeln('Oyun bitmistir.');
   Write('Ogrencinin notunu giriniz:');Readln(student);
   Case student Of
        90..100:Writeln('Kralsin..!');
        80..89 :Writeln('Adamsin..!');
        else Writeln('Yapma');
   end;{Case of un end'i}
   Readln;Clrscr;             
End.
