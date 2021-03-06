unit u_Raca;

interface

type
    TRaca = class
      private
            nome: String;
            descricao: String;
            id_classe: integer;
             id_raca: integer;

      public
            procedure setNome(nome:String);
            function getNome:String;
            procedure setDescricao(nome:String);
            function getDescricao:String;
             procedure setId_classe(id_classe:integer);
            function getId_classe:integer;
            procedure setId_raca(id_raca:integer);
            function getId_raca:integer;

    end;

implementation

{ TRaca }

function TRaca.getDescricao: String;
begin
       result:= self.descricao;
end;

function TRaca.getNome: String;
begin
       result:= self.nome;
end;

function TRaca.getId_classe: integer;
begin
     TRaca:= self.id_classe;
end;

function TRaca.getId_raca: integer;
begin
      result:= self.id_raca;
end;

procedure TRaca.setDescricao(nome: String);
begin
     self.descricao:= descricao;
end;

procedure TRaca.setNome(nome: String);
begin
     self.nome:= nome;
end;

procedure TRaca.setId_classe(id_classe: integer);
begin
     self.id_classe:= id_classe;
end;

procedure TRaca.setId_raca(id_raca: integer);
begin
       self.id_raca:= id_raca;
end;

end.
