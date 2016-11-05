{Programin tek sikintisi kullanicidan 1 lerin yerini sirali şekilde almak istemesi:}
program semester_project;
Uses Crt,DateUtils,sysutils;
Var  
     kelime,kelime_2:string;{starting game}
     q:string;{starting game }
     a:byte;
{^İnput Parameters^}
     u_name:String;
     length,width,tcell,time:integer;{*All the input parameters*}
     u_point:integer;
{^Loops^}     
     i,j,m,n:integer; {loops}
{^Degiskenler^}
     k:integer;
     Joker:byte;
     Tmp:integer;
     x:integer;{random number}
{^Array^}
     satir_arama:integer;{tcell yerlerini bulmaya çalişan değişken}
{^Matrix^}
     satir_matrisi:Array[1..3,1..16] of integer;{tcell yerlerini tutan dizi}
     raceway  :Array[1..10,1..16] of Char;{asil dizi}
     raceway_2:Array[1..10,1..16] of Char;{yedek dizi içinde '*' lar var.}
{^Time degiskenleri^}
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
    Write('The name of the user:');Readln(u_name);
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
   Readln;
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
			 for i:=1 to tcell do begin writeln(j,'.ci sutundaki "1" olan yerler: ',satir_matrisi[i][j]); end; {DEBUG}
			 end;{for'un end'i}
    {*2.ci Yol
    Randomize;
    for j:=1 to length do begin 
                         Tmp:=0;
                         for i:=1 to width do begin
                                              x:=Random(2);
                                              if x=0 then raceway[i][j]:='0'
                                                     else begin if Tmp<tcell then begin     
                                                                                  raceway[i][j]:='1';
                                                                                  Tmp+=1;
                                                                                  end
                                                                             else begin
                                                                                  raceway[i][j]:='0';
 										  end;
                                                          end;
    *}
    {Ya da burda while kullanilabilir.}  
    {Burda for'u tcell değeri kadar döndür.Bunlardan önce raceway[][] matrisinin  tüm elemanlarini 0 ata.}
    {*2.ci Yol
                         j:=1;
                         Tmp:=0;
                         while Tmp<tcell do begin
                                            x:=Random(1);
                                            if x=0 then raceway[j][i]:='0'
                                                   else raceway[j][i]:='1';
                                            Tmp+=1;
                                            j+=1;
                                            end;
    *}
    END;{Do_Matrix fonksiyonun sonu}
Procedure Sort_satir_matrisi;
    BEGIN
    {satir_matrisi siralanir.}
    Readln;
{Selection Sort}
{*Siralamiyor...
    for j:=1 to length do begin 
                        for i:=1 to tcell-1 do begin
					       Enk:=satir_matrisi[i][j];
                                               Enk_yer:=i;
                      			       for n:=i+1 to tcell do begin 
			                                              if Enk>satir_matrisi[n][j] then begin 
											              Enk:=satir_matrisi[n][j];
												      Enk_yer:=n;				
												      end;
				  	       Tmp:=satir_matrisi[i][j];
					       satir_matrisi[i][j]:=Enk;
					       satir_matrisi[Enk_yer][j]:=Tmp;
								      end;
					      end;
                        for i:=1 to tcell do begin writeln(j,'.ci sutundaki "1" olan yerlerin sirali yerleri: ',satir_matrisi[i][j]); end; DEBUG
                        Readln;
                        end; for'un end'i
*}
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
                        for i:=1 to tcell do begin writeln(j,'.ci sutundaki "1" olan yerlerin sirali yerleri: ',satir_matrisi[i][j]); end; {DEBUG}
                        Readln;
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
   {Delay(5000);}
   {Clrscr;}
   END;
Procedure Show_Fake_Matrix;
   BEGIN
   {*Sahte matris gösterilir.(*) larla dolu olan.*}
   {*Oyunun icinde kontrol etmeler*}
   {for i:=1 to tcell do begin satir_dizisi[i]:=0; end;}{Gerekirse bu yazilir zaten üzerine değer aticaz.Yani yazmamiza gerek yok.}
		 for i:=1 to length do begin
                                       gotoxy(3*i+2,1+14);Write(i);
                                       gotoxy(3*i+2,2+14);Write('=');
                                       for j:=1 to width do begin
					                    gotoxy(1,j+2+14);Write(j);
							    gotoxy(3,j+2+14);Write('|');
                                                            gotoxy(3*i+2,j+2+14);Write(raceway_2[j][i]);
                                                            end;
                                       end;
                 Readln;
   END;
{********************************************************************************************** ANA PROGRAM ***************************************************************************************************}
Begin
   Starting_Game;
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
   while m<length+1 do begin
                       Clrscr;
                       Show_Real_Matrix;
		       Writeln;
                       Show_Fake_Matrix;
                       Tmp:=0;k:=0;
                       while Tmp<tcell do begin
                                    Write(m,'.ci sutun da bulunan 1 elemanlarinin bulundugu satir no:<99 girerse Joker hakkini kullanirsin>');Readln(satir_arama);
                                    if (satir_arama=99) And (Joker=1) then begin 
									   Tmp+=1;
									   k+=1;
									   Joker:=0;
									   end
                                                                      else begin
                                                                           if raceway[satir_arama][m]='1' then begin 
	                                                                                                     k+=1;
                                                                           			             Tmp+=1;
					                                   			             end
                                                                      				          else begin
                                                                           			             Tmp:=49;
                                                                           			             end;
                                                                           end;
                                    end;{2.while'in end'i}
                      if Tmp=49 then begin
                                if k>0 then begin 
 			                    for i:=1 to satir_matrisi[k][m] do begin raceway_2[i][m]:='0' end;
                                            for i:=1 to k do begin 
                                                             raceway_2[satir_matrisi[i][m]][m]:='1';
                                                             end;  
                                            end
                                       else begin end;   
                                m:=2*(length);
     		                end
                          else begin 
			       for i:=1 to width do begin raceway_2[i][m]:=raceway[i][m]; end;
		               end;
                     m+=1;
 		     u_point+=k;
                     end;{while'un end'i}
   Clrscr;
   Show_Real_Matrix;
   Show_Fake_Matrix;
   ToTime:=Now;
   DiffSeconds:=SecondsBetween(ToTime,FromTime);
   if m=length then begin Writeln('Hepsini dogru bildiniz.'); end
               else begin Writeln('Hayir hayir olamaz.'); end;
   Writeln('Toplam Puaniniz:',(length+width+u_point)/DiffSeconds);
   Write('Time: ',DiffSeconds); 
   Readln;Clrscr;             
   Readln;
   
End.
