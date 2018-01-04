program v3_donem_odevi;
Uses Crt;
Var
    i,j,r:integer;
    e:integer;
    currentx, currenty:integer;
    playerScore, computerScore: integer;
    toplamDogruSayisi: integer;
    siraIndeksi:integer;
    computerPredictionX1, computerPredictionY1, computerPredictionX2, computerPredictionY2:integer;
    m,n,g,g2:integer;
    x:integer;
    k,l,q,w:integer;
    dizi:Array[1..18] of integer;
    dizi2:Array[1..18] of integer;
    C:Array[1..6,1..6] of char;
    T:Array[1..6,1..6] of char;
    aynimi:integer;
    oncedenacilmismi:integer;
    AcilmisIsaretler:Array[1..36] of char;
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
    g2:=Trunc(n*n/4);
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
                {* dogru olan isaretleri topluyoruz. *}
                AcilmisIsaretler[toplamDogruSayisi] := C[k][l];
            end
            else
            begin
                Write('Yanlis bildin...(Her yanlis ta bir sey olmaz.)');
            end;
            Delay(5000);
        end
        else {* sira bilgisayarda *}
        begin
            Writeln('Sira bilgisayarda.');
            {* onceden acilmis mi kontrol et. 1.ci x ve y icin. *}
            oncedenacilmismi := 0;
            while oncedenacilmismi = 0 do
            begin
                computerPredictionX1 := Random(g2)+1;
                computerPredictionY1 := Random(g2)+1;
                Writeln('Dongu icindeki: x1 ve y1: ', computerPredictionX1, ' ',computerPredictionY1);
                Writeln('ToplamDogruSayisi: ', toplamDogruSayisi);
                Writeln('Deger: ', C[computerPredictionX1][computerPredictionY1]);
                for i:=1 to toplamDogruSayisi do
                begin
                    Writeln('AcilmisIsaret: ', AcilmisIsaretler[i]);
                    if AcilmisIsaretler[i] = C[computerPredictionX1][computerPredictionY1] then
                    begin
                        oncedenacilmismi := 1;
                        Writeln('Evet onceden acilmis.');
                    end;
                end;
            end;

            {* onceden acilmis mi kontrol et, ve 1.ci x ve y ile ayni mi kontrol et.* }
            oncedenacilmismi := 0;
            aynimi := 0;
            while (oncedenacilmismi = 0) OR (aynimi = 0) do
            begin
                computerPredictionX2 := Random(g2)+1;
                computerPredictionY2 := Random(g2)+1;
                Writeln('Dongu icindeki: x2 ve y2: ', computerPredictionX2, ' ',computerPredictionY2);
                Writeln('ToplamDogruSayisi: ', toplamDogruSayisi);
                for i:=1 to toplamDogruSayisi do
                begin
                    Writeln('AcilmisIsaret: ', AcilmisIsaretler[i]);
                    if not (AcilmisIsaretler[i] = C[computerPredictionX2][computerPredictionY2]) then
                    begin
                        oncedenacilmismi := 1;
                    end;
                end;
                if not ((computerPredictionX1 = computerPredictionX2) AND (computerPredictionY1 = computerPredictionY2)) then
                begin
                    aynimi := 1;
                end;
            end;
            
            {* suanki x y kordinatlari ogren. *}
            currentx := WhereX;
            currenty := WhereY;

            {* 1.ci random kordinati yaz.*}
            gotoxy(2*computerPredictionY1+1, computerPredictionX1+2);
            Write(C[computerPredictionX1][computerPredictionY1]);

            {* 2.ci random kordinati yaz. *}
            gotoxy(2*computerPredictionY2+1, computerPredictionX2+2);
            Write(C[computerPredictionX2][computerPredictionY2]);

            {* eski yere don. *}
            gotoxy(currentx, currenty);

            writeln('Bilgisayarin hamlesi : ','(',computerPredictionX1,' , ',computerPredictionY1,')','(',computerPredictionX2,' , ',computerPredictionY2,')' );
            {*Bilgisayar puan kontrolü...*}
            if C[computerPredictionX1][computerPredictionY1]=C[computerPredictionX2][computerPredictionY2] then
            begin
                Write(' Bilgisayar Dogru bildi.... Her dogru 1 puan verir.');
                toplamDogruSayisi+=1;
                computerScore+=1;
                T[computerPredictionX1][computerPredictionY1]:=C[computerPredictionX1][computerPredictionY1];
                T[computerPredictionX2][computerPredictionY2]:=C[computerPredictionX2][computerPredictionY2];
                AcilmisIsaretler[toplamDogruSayisi] := C[computerPredictionX1][computerPredictionY1];
            end
            else
            begin
                Write('Bilgisayar yanlis bildi...(Her yanlis ta bir sey olmaz.)');
            end;
            Delay(3000);
            Readln();
        end;
        //Readln;Clrscr;
        Clrscr;
        siraIndeksi+=1;
	end;{while'in end'i}
    Write('Tebrikler.Oyun tamamlandi.');
    Readln;
End.
