unit u_Monstros;

interface

type
  TMonstros = class
    private
        id : integer;
        nome: String;
        descricao: String;
        experiencia: integer;
        vida: integer;


    public
          procedure setId(id:integer);
            function getId:integer;
            procedure setNome(nome:String);
            function getNome:String;
            procedure setDescricao(descricao:String);
            function getDescricao:String;
            procedure setExperiencia(experiencia: String);
            function getExperiencia:String;
            procedure setVida(experiencia: integer);
            function getVida:integer;

  end;

implementation

{ TMonstros }

function TMonstros.getDescricao: String;
begin
     result:= self.descricao;
end;

function TMonstros.getExperiencia: String;
begin
     result:= self.experiencia;
end;

function TMonstros.getId: integer;
begin
     result:= self.id;
end;

function TMonstros.getNome: String;
begin
     result:= self.nome;
end;

function TMonstros.getVida: integer;
begin
     result:= self.vida;
end;

procedure TMonstros.setDescricao(descricao: String);
begin
     self.descricao:= descricao;
end;

procedure TMonstros.setExperiencia(experiencia: String);
begin
     self.experiencia:= experiencia;
end;

procedure TMonstros.setId(id: integer);
begin
     self.id:= id;
end;

procedure TMonstros.setNome(nome: String);
begin
     self.nome:= nome;
end;

procedure TMonstros.setVida(experiencia: integer);
begin
     self.vida:= vida;
end;

end.
