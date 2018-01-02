program v3_donem_odevi;
Uses Crt;
Var 
    i,j,r:integer;
    e:integer;
    currentx, currenty:integer;
    playerScore, computerScore: integer;
    toplamDogruSayisi: integer;
    siraIndeksi:integer;
    computerPredictionX1, computerPredictionY1, computerPredictionX2, computerPredictionY2: integer;
    m,n,g:integer;
    x:integer;
    k,l,q,w:integer;
    dizi:Array[1..18] of integer;
    dizi2:Array[1..18] of integer;
    C:Array[1..6,1..6] of char;
    T:Array[1..6,1..6] of char;
Procedure Display_Game_Info;
BEGIN
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
    Writeln();
    Write('Oyuncunun Puani: ');
    Writeln(playerScore);
    Write('Bilgisayarin Puani: ');
    Writeln(computerScore);
    Writeln();
END;
Begin
    Clrscr;
    //Starting_Game;
    {*-------------------------------------------------------------------------------------------------------------------------------*}
    {*Matrisin buyuklugu alinir ve Matrisin elemanlari bilgisayar uretir.*}
    Write('Matrisinin buyuklugunu giriniz:');Readln(n);
    if n mod 2 = 1 then
    begin
        Write('Cift sayi girmelisin!');
        exit;
    end;
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
                            1:C[i][j]:='1';
                            2:C[i][j]:='2';
                            3:C[i][j]:='3';
                            4:C[i][j]:='4';
                            5:C[i][j]:='5';
                            6:C[i][j]:='6';
                            7:C[i][j]:='7';
                            8:C[i][j]:='8';
                            9:C[i][j]:='%';
                            10:C[i][j]:='#';
                            11:C[i][j]:='!';
                            12:C[i][j]:='~';
                            13:C[i][j]:='?';
                            14:C[i][j]:='&';
                            15:C[i][j]:='|';
                            16:C[i][j]:='+';
                            17:C[i][j]:='9';
                            18:C[i][j]:='0';
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
                            1:C[i][j]:='1';
                            2:C[i][j]:='2';
                            3:C[i][j]:='3';
                            4:C[i][j]:='4';
                            5:C[i][j]:='5';
                            6:C[i][j]:='6';
                            7:C[i][j]:='7';
                            8:C[i][j]:='8';
                            9:C[i][j]:='%';
                            10:C[i][j]:='#';
                            11:C[i][j]:='!';
                            12:C[i][j]:='~';
                            13:C[i][j]:='?';
                            14:C[i][j]:='&';
                            15:C[i][j]:='|';
                            16:C[i][j]:='+';
                            17:C[i][j]:='9';
                            18:C[i][j]:='0';
                        end;{case'in end'i}
                        T[i][j]:='-' 
                    end;{else'in end'i}	
                end;{else kolunun end'i}        
            end;{while'in end'i}
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
    playerScore := 0;
    computerScore := 0;
    toplamDogruSayisi := 0;
    siraIndeksi := 0;
    while toplamDogruSayisi < g do
    begin
{*--------------------------------------------------------------------------------------------------------------------------------------------*}
{*Matrisin elemanlari kapalidir.Ve bilmeye calisiriz.*}
        Display_Game_Info;
        if siraIndeksi mod 2 = 0 then
        begin {* sira kullanicida *}
            Write('Secilen matris elemanin satiri:');Readln(k);
            Write('Secilen matris elemanin sutunu:');Readln(l);
            currentx := WhereX;
            currenty := WhereY;
            gotoxy(2*l+1, k+2);Write(C[k][l]);
            gotoxy(currentx, currenty);
            Write('Hedef matris elemanin satiri:');Readln(q);
            Write('Hedef matris elemanin sutunu:');Readln(w);
            currentx := WhereX;
            currenty := WhereY;
            gotoxy(2*w+1, q+2);Write(C[q][w]);
            gotoxy(currentx, currenty);
    {*--------------------------------------------------------------------------------------------------------------------------------------------*}
    {*Matrisin elemanlari kiyaslanir.Ve esitse diger matriste gosterilir.*}               
            if C[k][l]=C[q][w] then
            begin 
                Write('Dogru bildin...Aferin. Her dogru 1 puan verir.');
                toplamDogruSayisi+=1;
                playerScore+=1;
                T[k][l]:=C[k][l];
                T[q][w]:=C[q][w];
            end
            else
            begin 
                Write('Yanlis bildin...(Her yanlis ta bir sey olmaz.)');
            end;
            Delay(5000);
        end
        else {* sira bilgisayarda *}
        begin
            Writeln('Sira bilgisayarda aq.');
            computerPredictionX1 := Random(g)+1;
            computerPredictionY1 := Random(g)+1;
            currentx := WhereX;
            currenty := WhereY;
            gotoxy(2*computerPredictionY1+1, computerPredictionX1+2);Write(C[computerPredictionX1][computerPredictionY1]);
            gotoxy(currentx, currenty);
            Delay(2000);
            computerPredictionX2 := Random(g)+1;
            computerPredictionY2 := Random(g)+1;
            currentx := WhereX;
            currenty := WhereY;
            gotoxy(2*computerPredictionY2+1, computerPredictionX2+2);Write(C[computerPredictionX2][computerPredictionY2]);
            gotoxy(currentx, currenty);
            Readln();
        end;
        //Readln;Clrscr;
        Clrscr;
        siraIndeksi+=1;                
	end;{while'in end'i}
    Write('Tebrikler.Oyun tamamlandi.');
    Readln;
End.

