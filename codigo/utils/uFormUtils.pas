unit uFormUtils;

interface

uses
  Vcl.Forms;

type
  TFormUtils = class
    private

    protected

    public
      class procedure SetarTelaPrincipal(NewMainForm: TForm);
end;


implementation

{ TFormUtils }


class procedure TFormUtils.SetarTelaPrincipal(NewMainForm: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := NewMainForm;
end;

end.
