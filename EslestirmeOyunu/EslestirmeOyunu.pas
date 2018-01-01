program v3_donem_odevi;
Uses Crt;
Var  i,j,r:integer;
     e:integer;
     m,n,g:integer;
     x:integer;
     f,d:integer;
     k,l,q,w:integer;
     dizi:Array[1..18] of integer;
     dizi2:Array[1..18] of integer;
     C:Array[1..6,1..6] of char;
     T:Array[1..6,1..6] of char;
Begin
    Clrscr;
    {*-------------------------------------------------------------------------------------------------------------------------------*}
    {*Matrisin buyuklugu alinir ve Matrisin elemanlari bilgisayar uretir.*}
    Write('Matrisinin buyuklugunu giriniz:');Readln(n);
    g:=Trunc(n*n/2);
    for i:=1 to g do begin dizi[i]:=0;dizi2[i]:=0 end;
    m:=0;
    Randomize;
    for i:=1 to n do
    begin
        for j:=1 to n do
        begin
            e:=1;
            while e=1 do
            begin
                if dizi[g]=0 then 
                begin    
                    x:=Random(g)+1;
                    for r:=1 to g do
                    begin 
                        if dizi[r]=x then begin e:=2; end;
                    end;{3.cı for'un end'i}
                    if e=2 then
                    begin
                        e:=1;
                    end
                    else
                    begin
                        m+=1;
                        dizi[m]:=x;
                        e:=0;
                        CASE x OF
                            1:C[i][j]:='%';
                            2:C[i][j]:='#';
                            3:C[i][j]:='!';
                            4:C[i][j]:='~';
                            5:C[i][j]:='?';
                            6:C[i][j]:='&';
                            7:C[i][j]:='|';
                            8:C[i][j]:='+';
                        end;{case'in end'i}
                        T[i][j]:='-'
                    end;{else'in end'i}	    
                end{then kolunun end'i}
                else
                begin
                    x:=Random(g)+1;
                    for r:=1 to g do
                    begin
                        if dizi2[r]=x then begin e:=3; end;
                    end;
                    if e=3 then
                    begin
                        e:=1;
                    end
                    else
                    begin
                        dizi2[m]:=x;
                        m-=1;
                        e:=0;
                        CASE x OF
                            1:C[i][j]:='%';
                            2:C[i][j]:='#';
                            3:C[i][j]:='!';
                            4:C[i][j]:='~';
                            5:C[i][j]:='?';
                            6:C[i][j]:='&';
                            7:C[i][j]:='|';
                            8:C[i][j]:='+';
                        end;{case'in end'i}
                        T[i][j]:='-' 
                    end;{else'in end'i}	
                end;{else kolunun end'i}        
            end;{while'in end'i}
            {*
            CASE x OF
                1:C[i][j]:='%'
                2:C[i][j]:='#'
                3:C[i][j]:='!'
                4:C[i][j]:='~'
                5:C[i][j]:='?'
                6:C[i][j]:='&'
                7:C[i][j]:='|'
                8:C[i][j]:='+'
            end;{case'in end'i}
            *}	     	
        end;{2.for'un end'i}  
    end;{1.for'un end'i}
{*--------------------------------------------------------------------------------------------------------------------------------------------*}
{*Oyunun baslamasi ve asil matris elemanlari belli sure gosterilir.*}
    Clrscr;
    Write('Oyun Basmasi icin herhangi bir tusa basin:');Readln;
    Clrscr;
    {*Matrisin elemanlari belli zaman gosterilir.*}
    for i:=1 to n do
    begin
        gotoxy(1,i+2);Write(i,'|');
        gotoxy(2*i+1,1);Write(i);
        gotoxy(2*i+1,2);Write('=');			    
        for j:=1 to n do
        begin			    
            gotoxy(2*j+1,i+2);Write(C[i][j]);
            if (i+j)=(2*n) then begin Delay(5000); end;
        end;
    end;
{*--------------------------------------------------------------------------------------------------------------------------------------------*}
    {*Oyunun icinde kontrol etmeler*}
    d:=1;f:=0;
    while d<4 do
    begin
{*--------------------------------------------------------------------------------------------------------------------------------------------*}
{*Matrisin elemanlari kapalidir.Ve bilmeye calisiriz.*}
	    for i:=1 to n do
        begin
            gotoxy(1,i+2);Write(i,'|');
            gotoxy(2*i+1,1);Write(i);
            gotoxy(2*i+1,2);Write('=');
            for j:=1 to n do
            begin
                gotoxy(2*j+1,i+2);Write(T[i][j]);
            end;
        end;
        Readln;
        Write('Secilen matris elemanin satiri:');Readln(k);
        Write('Secilen matris elemanin sutunu:');Readln(l);
        Write('Hedef matris elemanin satiri:');Readln(q);
        Write('Hedef matris elemanin sutunu:');Readln(w);
{*--------------------------------------------------------------------------------------------------------------------------------------------*}
{*Matrisin elemanlari kiyaslanir.Ve esitse diger matriste gosterilir.*}               
        if C[k][l]=C[q][w] then
        begin 
	        Write('Dogru bildin...Aferin');
            f+=1;
            T[k][l]:=C[k][l];
            T[q][w]:=C[q][w];
        end
        else
        begin 
		    Write('Yanlis bildin...(Her yanlis 1 hakkini alir)');
            d+=1;
        end;
        Readln;Clrscr;
        if f=(n) then begin d:=5; end;                                        
	end;{while'in end'i}
    if d=5 then begin Write('Tebrikler.Hepsini dogru bildin.');end;
    Readln;
End.

