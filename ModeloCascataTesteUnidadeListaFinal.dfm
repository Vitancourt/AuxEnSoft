�
 TFORMMODELOCASCATATESTEUNIDADELISTAFINAL 0�B  TPF0(TFormModeloCascataTesteUnidadeListaFinal'FormModeloCascataTesteUnidadeListaFinalLeftTopHBorderStylebsToolWindowCaption"Ferramenta AuxEnSoft - Lista finalClientHeightrClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1OldCreateOrderOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TPanel
PanelListaLeftTopWidthQHeightcTabOrder  TLabel	lblTestesLeftTopWidth|HeightCaptionLista de testes de unidade  TDBGridgridtabelasLeftTopWidthAHeight
DataSourceSourceReadOnly	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TLabeledEditedtProcurarLeftTop(WidthAHeightCharCaseecUpperCaseEditLabel.WidthIEditLabel.HeightEditLabel.CaptionProcurar/NomeTabOrder OnChangeedtProcurarChange  TBitBtnbtnSelecionarLeftTop@WidthKHeightCaption
SelecionarTabOrderOnClickbtnSelecionarClick  TBitBtn	btnVoltarLeft Top@WidthKHeightCaptionVoltarTabOrderOnClickbtnVoltarClick  TBitBtnbtnImprimirListaLeft`Top@WidthKHeightCaptionImprimir listaTabOrderOnClickbtnImprimirListaClick   TPanellabelCriarTesteUnidadeLeft`Top Width�HeightiTabOrder TLabel	lblTituloLeftTopWidthgHeightCaptionCriar teste de unidade  TLabellblDescricaoLeftTopHWidth7HeightCaption   Descrição *Enabled  TLabellblTipoLeftTop� WidthHeightCaptionTipo *Enabled  TLabellblSituacaoLeft� Top� Width1HeightCaption   Situação *Enabled  TLabeledEditedtIdentificadorLeftTop(WidthQHeightCharCaseecUpperCaseEditLabel.WidthJEditLabel.HeightEditLabel.CaptionIdentificador/IDEnabled	MaxLength
ReadOnly	TabOrder OnChangeedtIdentificadorChange  TLabeledEditedtNomeLefthTop(WidthHeightCharCaseecUpperCaseEditLabel.WidthEditLabel.HeightEditLabel.CaptionNomeEnabled	MaxLength�ReadOnly	TabOrder  TMemomemoDescricaoLeftTopXWidthqHeight� Enabled	MaxLength�ReadOnly	TabOrder  	TComboBoxcboxTipoLeftTop� Width� HeightStylecsSimpleEnabled
ItemHeightTabOrderItems.StringsDATA   NÚMEROSSENHA   DOMÍNIOCPF/CNPJ, ETCOUTROS   	TComboBoxcboxSituacaoLeft� Top� Width� HeightStylecsSimpleEnabled
ItemHeightTabOrderItems.StringsAPROVADOPENDENTE	REPROVADO   TLabeledEditedtDataTesteLeftTop Width� HeightEditLabel.Width@EditLabel.HeightEditLabel.CaptionData do testeEnabled	MaxLength
ReadOnly	TabOrder  TBitBtn	btnLimparLeftTopHWidthKHeightCaptionLimparTabOrderOnClickbtnLimparClick   	TMainMenu	MainMenu1Left� Top 	TMenuItemAjuda1CaptionAjudaOnClickAjuda1Click  	TMenuItemLogoff1CaptionLogoffOnClickLogoff1Click   TZQueryQuery
ConnectionFormHome.ConectaParams Left� Top&  TDataSourceSourceDataSetQueryLeft� Top&  TZQuery
queryLista
ConnectionFormHome.ConectaSQL.Strings{select * from tbtesteunidade where codigo_projeto=(select codigo_projeto from tbprojetoacesso order by codigo desc limit 1) Params LefthTop�   TRvDataSetConnectionConectaListaRuntimeVisibilityrtDeveloperDataSet
queryListaLefthTop�   
TRvProjectProjectListaProjectFileQC:\Users\server\Desktop\TCC\AuxEnSoft\relatorioModeloCascataTesteUnidadeLista.ravLefthTopRaveBlob�4 �n��샢@RAVE�    Report2 TRaveProjectManagerRaveProjectCompileNeeded FalseFullNameRaveProject
Categories 
Parameters PIVars UnitsFactor       ��?  	DataView1TRaveDataView�  � �B���e"N����w�ap�x�!�ͧI��N2�L�  �a6̠�1��l'M�P4F�� �ɸ�e1�&�t�fOh�a��  $�I7�s)ȍ6�)�T�o2L��@&�e�Ѧ�k=��,�L&W;���)�OFP�U`�3���n3�� �$Rtn�J��%��L����3��an�8��q��K+9��f<q��l��3����xi�[%�N '����0`8G[��c1���)7�hGwK��^|�'K�,��F^�Ϻ��Nf�����[^g~����hץ�%� H%�lF��m_��dMե=���w:a�%��иyZ�V�T�U�i\W��^Wլ_!�jGG��g���o�#�B��Ih_���A_�M�b7�p�h�iHՑ�fr�o��f�b��ir��m�T)�f�"�Report1  �J9�b @��`*
1 ʅ#	��R2��#�1�A ���p4���)��.���&Ù�F:���	���FcgA�$�i9ΐ8( ��E��0*r��N�ZH  (J���/���  JBH��Q@`��(�a�H3<�,��d�F)�bC�$F&��b�0�6�X�3JPB�H��EH� D�8���L��I� ��\w�c����8
 b����|���m�	�T��r8r�)��tP��D�H�4�X �+T� �ǗKA�s]7B!t[E�C�P�	�0��5�K
q0A3   ��l!��� �@c
D�(g+�� �DQ� �cl���G�p�5@� ��!�1�����`< @"�1��6��R*Iô��R��$���s�5�4���� @|9�"d�<���3(��0 lcĐE�  )��1�� A����@	F!�J��l�S��P�D#  t!Ca�b���oMSP c��EqT�MQ#	��^ IP��``$BA��+ȱl0  0�DB�?0�c���P$H�PpLQL�DQPr%�S� �a���Rt�D�, L�Dr��E�!b|4�] �SP�u�T�A\@ ���Ǣ\w SH�)����)ʠ(p0
�L 7.��2��\@ ����p�H �Ь
��+�@+Y)�@(�
J��� ��?�¼F������p`+������/y�'9�.9� �H�/z Ȃ':!Ȃ.:"��)�30
=ó#�r�j��, ����+���)�p�+��(�/H�����*0���j0���1�� 
���
ш� �B��&�p��,L�,62������ ᄐ�`rC@Y ���H-`H^p��� ��a�2Ap��X�!V/�����7�!z=E�^ �
��28�`�
�� �C�V
�"�����bq8$���c�5���P�B�T��L&�p�B�1�?�����q3Ch���[�Q�7�H��,hP�  ��p?��pGh.#�z�'GPyb<C���0��m���*���l
�	�(�lQ��P�؟�lW�L)E��a�
�n"�8���Op(=�X�¤W� �&�`��Y�v'�P���N�&6����}�0�+�0��G���3�H��m � C�`�TQ���$ 
a.|QN�(L�`	�0�# H�����4 `� j8�H���+=�x�	��
�1�CP� �#�PB���  ^B �#  q� ����@?�If\	�&��O@D#��HB�+��"�hE��!��`��#��C4�4�`j���a�:�F09��t���-��#��qp>@�c��H B@9 �2A$@�&� \��F��@H#��AH@  ��$ �\�A�&���ń<��RA���HSP�A�+BU�`$1��Jl
P(+D�2
��e����(��`	�`�ȅ��z�	�(L"d�A(3D�(�4��b)� �`L3��*E�7��o��d�`N#$�qL&Ę�T"Dm�>�b�<��2A����HDxa`�S�Q��Z��@A� chArB ��� � L	�h���c��� &@ H��z!��A�~�� ����!�~u@�`�F%���8h	P�)A���l@�Bx(S�1� �PA�<u �t)ĥ��h!� �LP�B$]	�:A�Q�Pm0F�P@�K���;���#x������H*����c���E�N�E���DC��@$����G(	8u ��@H3�P�
C�:- �N���
�Z HUBxe��%ƨ�B��
�'�xO�1�1����L6��,����\��~;+�A{��N�`��|Y	a�! B�@ah%���#�հ0"�Hà(�Q���?Ѳ4@�E�6���P�@���$�`�����H�	��P�a�uF�)�@���$�S �>
�
+��$��� �A� �v8CXjH_�q�(��a�w��./Ð�!pP1 �p@\ (d�y�!�5��Sc��q�73��p���!p( DZ:����}�h>�X�cD1���&�( +��� �8�pK@_�N@�а` ��
�� ��g_@<�A�Sq7�`l	� �
P�	 ��nnPeP�  � � �|�W m�
�0��9  L	p�0�b ,%0iP< w�% ���H�V ��#�e
��ЯP���
0>p,	��p�����	 ��1 -	�J
��pX	Fpv����	���O0�fP���0� �7	 ��`�����P� p�p4 X � /�
0� �	 i�P� 6p- �P p����h�\�E
�*�S@`SP���p@&	0�П�0`��T����������������8@�����Ј�PT���� �L �P� �0"@����_0�� d�����Oз�n@l�I
�����r m
$ B	P�	@������ �	
��0��t�Ip�x��" � �г pSpsp� *@ ���2�S@��A�|�	 �� �@�P� | �@0�
��	p� @�
�"@�����	��� 9 N	�0�p������դ����w
��@���
�K�w���h�`��&0�
��S�0�0��
`�K
�������@� �������	@���pP�P0	0�	0��T  �`> 7 `����
�E������-`�p3�����q�e`k	�9�`u�pe�	 ��� @� 0������@��@6���d	�G P�@�K Px���e@���D��  2�8�p�
�{��`�a���d�nE�PЅ0R@�@��L�	� ��p JD
�U@�R0� ���J@��% �EP�h���C@8 J@�@h@�
�KxfK ��LP(:��L�QP8��P��@P����\�h�� �e@�0a`���P�f`��Kp?@� p\@�`� ���ypHk`=  v`M�w H��@�0�� �Ј@��HPK`�  wp��:���O��@�0��	`� ��`��c`H	��@��%Ї���x
@K ���	`L��`0`@HP����8	�J`y@����Z�� `Dp���PM �����b@��W`��T�   J��@6ЊT �@��� x�����`�PP��X`��hۑ`�	����`	��  `v�`SP5@�0�@���
�r@H�f��`r+� P�	� ���u 	 [� �0�p Ik��@�V�s
 � �9z�[��0�	Љ��w
���D�j	�3Ћ`K	��� �&���t�=	0�	�c �pXxf�~R�D�g��@��Ѐ[��@�@�	��x�IcR�a	P0���Ї�P���  	,�	V�1��	�C
�
@�	 p_�w	����J�:�u@�	�~p	�� �0
 �	`��c �	�	p���	x� !@kp�	�$
�H	�� �p���0�P#	��p��� D@���	0j'���N��:	 �	�K��8pJ�2Q	@�:p�Dg�t	@�p��Ж�O @�p}��@�	PI�����:	Pt	p�pV	�� �@�	5�� m`�	��P�`>	0����A	������	pf�f	@H	�`���i�``> �`0���p9��@�	���O�b @�pc�	��	�X
��	P�Л��������<Z	�� �p�0�8|j� ��@� @�p��
f�-T�@ ��Y10(�J
 ���
 �	�E	�����������	 i�iД@�
X�S�b ��pJ	���
�4PЏ��0y��`�	Ј��P�	�S	��
����p��,&c`z�y����$��	�	-H���@H��p�
��	�_
�,�(��_ ����`V
 w�J�}	0(����
`TЍ��
@���`Y��pS `�p�	`e�~c@�@�p P?
;� �9	�	�� :���d���@�	PxО@�
�&�������	�j@�@�
���g�m�z�g��	�4K/>`��A0s`�
�z
pK �
w ����V������xН	@�
�	 p|�q� �L�y�p�&��@�pU	 �@�	���a��ˀ� D@�	��		�@��܄p�
@���s� t%�g	���?�� 0�à�	0�g��� �f�(
@�Ь@�@�n@�
��
@M @�	@K�J	���K
@��0�h�P 	��׳�pL JK�P�
�] ���;PE@�p/`'`WP+`v��PN�0� ��V`�ғ
�c
�;Pf�	PTp���k�v0��yI���	������k	p�����	������	� ���+�0K
P���`Q pA`����! @`)� �  h� 0�  Q_0��   ��  1xP l@�� 8faf
 f p	�� b� @
� ����pP   ``1�ŝ@ ��P���	�	� p �")�% 0@��& f �bP �� p@ `?� �r q pP�# t0a N � 	����	 U`Q�& ���
	�pA Report2#  �	�I��a3�@ �C`�xH T)N�R���o9 ����d���Ӂ��e'L�I� 
F0�fPA�l6�&�(G�@�1��s:E� ���2@�q T�C2���@ P$��6@��
[P  ���B;���1�P �F���`@A��h�4MC�)FQ�sR�+80F�0�(FєC0�C���  	!�!�d�q� (�Ҍ�0L8@g@@�Tt�v�bvz1L�P�Dڀ�<�Fa�)�T$R�(�2��� 'iܰ �&�%���h]�q�E:���8D�3N�,:-��8R8L�E�� ��l%&� @ ��2� ș; c��4R�8'DО4�� kLc��0J��@�Rx� ˲�0� dP7��rFl�$�D�  �*K�`u���T2�q�� ��`90$�2C\l��4�ưl��q�H�@o @G�A@xQ,�9G01� p c���/ 	M��\�pp0!`�<��D4D@l�"LPd��@�����|G�`7(@1PE��@4�F@� Da,�!���@ p@�!��Le����%P��� QC�$@D�\�N��b�1#�@�rF�h8�S0���Q"Q3E�d�$ʔ�E���	�TBQDS�3��� `D��h���1� u�3�q�2um(a��:���=�`�TKSt�$aP��`��r�G R�&�  pJ�lT)���x1E @"	�sQ �)�P�Z/GR��E@�tM�!�� @D8HC ��UH@�4��4�ҠU�� Gq��%�� � 1�   Gc�3�t�,� !@ 0p1m<"(e6 @2<H0��@	���  ]`pz��b�X��س 0� n�a� �@bDA���J �� �0F1��� `�A����@0|
�C��Qr
����
 ��0hM`�d�A�  8�A��p���A�0r��C�g�1���`p7��EX1�ԅ����l�! ���؂�<��h�����q>4G�^�.J�*@�9�<`�q��8���.p�4CȽas��!�<���#���:��p��~�1�:�����:=�H� t��! �L�N"�ظ�O�@�'�x���8��r=����a�D�1��z��*�#X `|; ��a�F�ð��ti� �;����@A�4 h�$g���18�
a�@��j,��� n1�`}a$a��f�@R��z `�#���?�0��Hc	�္c K��8X\ �4��l& `�CP� �D�7�Ph�6	�H�@���2��Ta�H�.�@&A�)� �E����'Ѷ:�w	�����>�؞ a�����V	��m��Bh���k���7���<&��*��a��� ����8(DO�A!��A`f��K1|9�P�� }��� �dAtr�� %ǘ�1��,��-�z	�f���@L���r*A�f�\M�0�Bh� �3A�' ��!8��r��b�:��r6A�g��O1�Bx9 �3�A�'����<\��~Ǡ� P��HA ��(	�(P@d!�����$(��R�"dJ �-��Gt
1�!��QA$$��j	�(�T)�v�+�Pc	��.D�H T�0h�8�X�4�P~* �!PP��(G� �R�At&BX��4UP�*B�:�DU
P�*��fcLUP���_�'���HY`�
�*'���#h�q�=���B�*�:H�� p��H"E��a����&;�xS`( A0E ��,�2�`%bt@@3���L�<0� �
 H�q`"��	��D�U�|p���� ��p�A('��V#h	
ٵ���{�l!���;D@Ӱ@��pB�;a�6� ����3��� �:Њ)��V�li<+�(�C�� �[��e�Qj.��R	b����" �"dU�nF��!lѵ�����T	A�=�x���B	��,@�HM��+�(� �[10G�'_��[
T;���	al"��0E�Zdvpd� �c�y�� ���� ���8��,c��20ø�cdv�
�0�T}	!� ��x��%�Xb�?P�ФS �P��P� �����"
��Н�3  �PEP� W`���[�}�`�@���0	'*���[E0��0�`[����� ��M�,]@qP� �Yp=�lPq0�����	 ��� t�I7p! AP� �
 �	@_�b��	��~����d�	`r,@��`�� 5Po
�y��|К u�`�`]��� ���� )���j����`i��P-P��g`�� 2`��{	07�m
�`�P�	@��g	���`  � ĉл�4P��O 0��� ���	@N �-	 "�]���Rd�h ^	��'�m
��г��
p~�-	��p��߆��`�02�����Pi��`k`����� �����nP�K0������������c��	Ј���R �
P�0��
0� �� �p6P� v�> �pp���	�h�d�G�.`�@6���.��6�t�*W >	�@�p�`.w��@�pO�;cЅm���E@��#g���������
���N ��N �0c���� g
0�0� l���8���e�?�i ���	�v	 u
$ B	`F
@��$ � ���
0��|�K�>p�P0#   �=p0�	P��| �� �	P�I�������p�
��	 �p1�@� ��  O�gЃ�kP�
 �@��  �	 � �&�Z 	 ��� 		�@���@gP� ��Zp]�5YP� �
�[	P������zP%�`~
P� ���W	p��6	�K
P�rp� u0p�U�wp�`��Z �G�0��wW�+�(7'`	P�p��\ 	@��k
�`Qp
PqP��� �v ���p��`{@� @	!	��� nPA @�`Sw R8u�Q0�`��qp#� � ���U uPH`u�O`\	@�0�wP��U `�UJ��" ����8`�P*B`�@� �ni�QPn`$PRP�P�@ZP3��	�T����	�� 3�pJ�e�]PM��@	���� %	 MP� h����X RPi��`�������Pb����ն��@�0����hp�
�������Ph������0j `�<������ �p07�L B<������ph0s`�  x�U ���X��P<��  ��L	 E ��0'{�����@� �W��0kp� @���GP����%B�F���@�`R
 ���T�(	 � h@���	�pU�0 ��m PYu��0�`L�G �0T�@ ��jPJpx����	R$ ��l`�	 �P�P< �pi��	`9@��1`	`y�� 3	`��M���	p	 � �hp��  �x i�_P��Y��/	[����R`�	0� �/P �  � ��  @��� �	`�� I �I	�
���� I��P��"	��P9
0����Y����`�� ���r	�����`�	�������P}������k �py �k���^	�\0x���0vP�
 A	�`�P<	@�`s�Qw�{0�pS	��	���o���̠������й	�~���������p�P�p9��`�@9�R�rP�	�� 6̍ �P� �@
@��q�`�
:��
�	��Zv0x@�P+ ����	 �� �	��0� P�w7	��0xPD	��p��h	�	�� �н��	�
�S�~&{ � ]  ������L � �q`� �	`Gp� �� @����	�y��P	�Y���	Еp�	p�	��@���	y�P>PWP�p��F�������
 ����
\�	���P�P `����e��4
 �]e�� ��p�M��k0
0��`vp�P=
0z���	0��k`�
 �@��V��0Rx�� ��9�
��	�ZЩ`�p� �� R P)	�s�	�E@S � �.	��p�`	�9�dɠg�P	�
��	@�	�%`�p50�	P� P�
ܑ ��0���	������0� �P(	�v����
�[�0�
��P�P+
��
�X���[����`�g�A	�� ��Pt
P����	���qp��w��	 �	�V�!p�
��  �V��[�E���\	�	 ���`nU�PU0�`0����P� � a�k
 5 �� �
�'W
.
�
@����%�u�- I@U�����T��� S��`� ���I0� �V`�
��p�
`�PPT�p�����PG���[�+ �Z	p���c�5p�PPe��`}P��S �	���P1
{
�0�	�oPJ�b`}
�z�T�AЦ	��P+
�P��(@ ��� �PY��Ы	�y	@�p���	09	�P(
G�	@ۼ��	����P@� � �y�Tp��`�	 (
���?��0\�P`U���
 e��`���	��@�P)����	�;К �k
�����R`Q`�PS
@�0 R �5����pi �@o�������NP)���M`� ��� ���@���# �� � �� �,0��lp�`A�
���; >  �@,0��P( �y����)4@� �� ��  @  x@  ��QD�r�A�	0�`"� � ( #��6 �I^�#@$�:o�x � �4 �@|L  �xF�p;�@�\(8 � 0� �b��
 �
`%� H�� �&� L 4 @j00 �dY � i 0�� d��aAT P	�x��� �! P *��`�#`h	bP7X@�	��  �H��d�� 2 � �h�`��p�@�� X�@@� ��X@�0 �`� 81�3� �Q�2��0e�� ��(@`p	 �= b$�
&�i�`1�@� �P����2�8 �| ��W�pd 0 &� L 7�Q2 ��d��� S �� � X
 �@d�H�( ��c$@�p�P1|�B1��pf���4���j p��� h0�8� 0�/
 3A���� %�@$O g �� � �sA8   ( 5���83�p~�R�2 �0d� �O0�dp?��l⋁ T ���2��h� ���������X@��A�`��3@b �-�!�\� T F(;@��v�L@ 02��
`��q`�1A�k��`���� b� M8@�3 �~� � `��X4������h
���L  c���^����2 z�d� '��� �!P	��B��� �A%����\+ ���p@ �` ��@ �+@� p�, �����8i�5 c�U�& @� f����`��7��(5�@ @n��A��0`���' ��N�,�� X �z�c�-,x<��d��&�m@�	�g���|h
 �`mp@�h ���P���#8 ^x@�8��
�
 ���� ��1 8��p$A��4@B��@ 4*4���;@R�q� m�6A0l����h'���|�<��x?AN@V�0 �`@�
��(�Q�� ��8 � 0?�	X <`4@|`e�xZ�4`Pp��
��7��`i0 ��A��w�|	��?P=A� ��G�;AP ����(@��q����a 9 � r��������D���P��>x+@J�P ��6@Zo�8���&�����@~�?@��v�����6���m@���� �ǂ@�/*���,�� S @0�x@I����Y��&�B. ��(A��u�?@�?���F+A�pn� @>9@x7T�@�~86@��r���� h'��z������`�?�`B=�P��  J� p���!��	��P���q �p0��Y1  �`� �n�����7A��k�����9�\nx�n6\@i�/ ~04���qy; �x8�\�m 8@��5A��$���� ��  S2�l�A�9�Px��!x9�\����� �@	2���X' ����@m�5��y�4 �x ���a���`���F�� �X<�`x���h=��!�m8��������F����Zԝ4�� ��]l����   -�H  s 0@|��@B(:��e��h:� {|`��=��o���$��< ���3���v<	@�p#A����`ߒ�� 2P/h�~�0��0{��-
��� �8���u <@�    