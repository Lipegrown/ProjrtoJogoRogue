unit u_Classe;

interface


type
    TClasse = class
      private
           classeDeArmadura: integer;
           iniciativa: integer;
           pontos_de_vida: integer;
           dados_de_vida: integer;
           id_classe: integer;
              id_raca: integer;
      public
             procedure setClasseDeArmadura(classeDeArmadura:integer);
            function getClasseDeArmadura:integer;
            procedure setIniciativa(iniciativa:integer);
            function getIniciativa:integer;
            procedure setPontos_de_vida(pontos_de_vida:integer);
            function getPontos_de_vida:integer;
            procedure setDados_de_vida(dados_de_vida:integer);
            function getDados_de_vida:integer;
             procedure setId_classe(id_classe:integer);
            function getId_classe:integer;
            procedure setId_raca(id_raca:integer);
            function getId_raca:integer;


    end;

implementation

{ TClasse }

function TClasse.getClasseDeArmadura: integer;
begin
      result:= self.classeDeArmadura;
end;

function TClasse.getDados_de_vida: integer;
begin
      result:= self.dados_de_vida;
end;

function TClasse.getIniciativa: integer;
begin
      result:= self.iniciativa;
end;

function TClasse.getPontos_de_vida: integer;
begin
       result:= self.pontos_de_vida;
end;

function TClasse.getId_classe: integer;
begin
     result:= self.id_classe;
end;

function TClasse.getId_raca: integer;
begin
      result:= self.id_raca;
end;

procedure TClasse.setClasseDeArmadura(classeDeArmadura: integer);
begin
      self.classeDeArmadura:= classeDeArmadura;
end;

procedure TClasse.setDados_de_vida(dados_de_vida: integer);
begin
     self.dados_de_vida:= dados_de_vida;
end;

procedure TClasse.setIniciativa(iniciativa: integer);
begin
     self.iniciativa:= iniciativa;
end;

procedure TClasse.setPontos_de_vida(pontos_de_vida: integer);
begin
     self.pontos_de_vida:= pontos_de_vida;
end;
procedure TClasse.setId_classe(id_classe: integer);
begin
     self.id_classe:= id_classe;
end;

procedure TClasse.setId_raca(id_raca: integer);
begin
       self.id_raca:= id_raca;
end;


end.

