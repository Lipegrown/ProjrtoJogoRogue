unit u_atributos;

interface

type
    TAtributos = class
      private
              forca: integer;
              destreza: integer;
              inteligencia: integer;
              constituicao: integer;
              sabedoria: integer;
              carisma: integer;
              percepcao: integer;
              
        public
            procedure setForca(forca:integer);
            function getForca:integer;
            procedure setDestreza(destreza:integer);
            function getDestreza:integer;
            procedure setInteligencia(inteligencia:integer);
            function getInteligencia:integer;
            procedure setConstituicao(constituicao:integer);
            function getConstituicao:integer;
            procedure setSabedoria(sabedoria:integer);
            function getSabedoria:integer;
            procedure setCarisma(carisma:integer);
            function getCarisma:integer;
            procedure setPercepcao(percepcao:integer);
            function getPercepcao:integer;


    end;

implementation

{ TAtributos }

function TAtributos.getCarisma: integer;
begin
      result:= self.carisma;
end;

function TAtributos.getConstituicao: integer;
begin
     result:= self.constituicao;
end;

function TAtributos.getDestreza: integer;
begin
      result:= self.destreza;
end;

function TAtributos.getForca: integer;
begin
     result:= self.forca
end;

function TAtributos.getInteligencia: integer;
begin
     result:= self.inteligencia;
end;

function TAtributos.getPercepcao: integer;
begin
      result:= self.percepcao;
end;

function TAtributos.getSabedoria: integer;
begin
     result:= self.sabedoria;
end;

procedure TAtributos.setCarisma(carisma: integer);
begin
      self.carisma:= carisma;
end;

procedure TAtributos.setConstituicao(constituicao: integer);
begin
      self.constituicao:= constituicao;
end;

procedure TAtributos.setDestreza(destreza: integer);
begin
      self.destreza:= destreza;
end;

procedure TAtributos.setForca(forca: integer);
begin
     self.forca:= forca;
end;

procedure TAtributos.setInteligencia(inteligencia: integer);
begin
      self.inteligencia:= inteligencia;
end;

procedure TAtributos.setPercepcao(percepcao: integer);
begin
     self.percepcao:= percepcao;
end;

procedure TAtributos.setSabedoria(sabedoria: integer);
begin
     self.sabedoria:= sabedoria;
end;

end.
