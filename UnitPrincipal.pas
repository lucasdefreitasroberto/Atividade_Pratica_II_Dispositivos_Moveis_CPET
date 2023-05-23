unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani;

type
  TFrmPrincipal = class(TForm)
    rectAbas: TRectangle;
    imgAba1: TImage;
    imgAba2: TImage;
    imgAdd: TImage;
    imgAba3: TImage;
    imgAba4: TImage;
    TabControl: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    rectMenu: TRectangle;
    lytMenu: TLayout;
    imgFechar: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    AnimationBtn: TFloatAnimation;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Image1: TImage;
    Image2: TImage;
    procedure imgAddClick(Sender: TObject);
    procedure AnimationBtnFinish(Sender: TObject);
    procedure imgFecharClick(Sender: TObject);
    procedure imgAba1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure OpenMenu(open: Boolean);
    procedure MudarAba(img: TImage);
  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

procedure TFrmPrincipal.OpenMenu(open: Boolean);
begin
    if NOT open then  // Fechando...
        AnimationBtn.Inverse := true
    else
    begin
        AnimationBtn.Inverse := false;
        Label1.Opacity := 0;
        Label2.Opacity := 0;
        Label3.Opacity := 0;
        Label4.Opacity := 0;

        rectMenu.Opacity := 0;
        rectMenu.Visible := true;
        TAnimator.AnimateFloat(rectMenu, 'Opacity', 1, 0.2);
    end;

    AnimationBtn.Start;
end;

procedure TFrmPrincipal.AnimationBtnFinish(Sender: TObject);
begin
    if NOT AnimationBtn.Inverse then // Abrindo o menu...
    begin
        TAnimator.AnimateFloat(Label1, 'Opacity', 1, 0.1,
                               TAnimationType.In, TInterpolationType.Circular);
        TAnimator.AnimateFloat(Label2, 'Opacity', 1, 0.4,
                               TAnimationType.In, TInterpolationType.Circular);
        TAnimator.AnimateFloat(Label3, 'Opacity', 1, 0.7,
                               TAnimationType.In, TInterpolationType.Circular);
        TAnimator.AnimateFloat(Label4, 'Opacity', 1, 1.0,
                               TAnimationType.In, TInterpolationType.Circular);
    end
    else
    begin
        TAnimator.AnimateFloat(rectMenu, 'Opacity', 0, 0.2);
        rectMenu.Visible := false;
    end;
end;

procedure TFrmPrincipal.MudarAba(img: TImage);
begin
    imgAba1.Opacity := 0.4;
    imgAba2.Opacity := 0.4;
    imgAba3.Opacity := 0.4;
    imgAba4.Opacity := 0.4;

    img.Opacity := 1;
    TabControl.GotoVisibleTab(img.Tag);
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    MudarAba(imgAba1);
end;

procedure TFrmPrincipal.imgAba1Click(Sender: TObject);
begin
    MudarAba(TImage(Sender));
end;

procedure TFrmPrincipal.imgAddClick(Sender: TObject);
begin
    OpenMenu(true);
end;

procedure TFrmPrincipal.imgFecharClick(Sender: TObject);
begin
    OpenMenu(false);
end;

end.
