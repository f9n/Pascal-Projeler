program dairesel_matris;
Uses Crt;
Type  matris_tanimlamak=ARRAY[1..20,1..20] of integer;
Var   mat,a_mat:matris_tanimlamak;
      i,j,k,a:integer;
      m_buyukluk:integer;
      sonuc:longint;
Begin
{Ekrani temizle.Matrisinin büyüklügünü kullanicidan al.Ve k  değişkenine "0" ata.}
     Clrscr;
     Write('Matrisinin buyuklugunu giriniz:');
     Readln(m_buyukluk);
     a:=0;
     k:=0;
{Asil matrisinin elemanlarini al}
     for i:=1 to m_buyukluk do 
     begin
        Writeln('Matrisin ',i,' ci satirinidaki elemanlari');
        for j:=1 to m_buyukluk do 
        begin
           Write(j,' ci elamani:');Readln(a_mat[i,j]);
        end;
     end;
{2 for döngüsü iç içe aç.}
     for i:=2 to m_buyukluk do 
     begin
        for j:=1 to m_buyukluk do 
        begin
           mat[1,j]:=a_mat[1,j];{asil matrisin 1.satirini geçici matrise ata.} 
           sonuc:=m_buyukluk+2-i+j-1;
           k:=sonuc mod m_buyukluk;{'sonuc'u matrisin buyuluklugune bölündügünde kalan }
           if k=0 then k:=m_buyukluk;
           mat[i,j]:=a_mat[1,k];
           if mat[i,j]=a_mat[i,j] then  a:=a+1; 
        end;
     end;
     if a=m_buyukluk*(m_buyukluk-1) then 
     begin Writeln('Dairesel matrisdir.') end
     else begin Writeln('Dairesel matris değildir.') end;
     Readln;
End.
