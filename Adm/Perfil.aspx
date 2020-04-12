<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Adm_Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | User Profile</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Perfil do cliente
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
            <li><a href="ListLead.aspx">Clientes</a></li>
            <li class="active">Perfil</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-md-3">

                <!-- Profile Image -->
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <asp:Image ID="ImageLogomarca" class="profile-user-img img-responsive img-circle" Style="width: 128px; height: 128px;" runat="server" alt="" title="" />

                        <!-- <img class="profile-user-img img-responsive img-circle" src="../../dist/img/user4-128x128.jpg" alt="User profile picture">-->

                        <h3 class="profile-username text-center">
                            <asp:Literal runat="server" ID="LiteralTituloPagina"></asp:Literal></h3>

                        <p class="text-muted text-center">
                            <asp:Literal runat="server" ID="LiteralDominio"></asp:Literal>
                        </p>

                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                                <i class="fa fa-envelope"></i><a class="pull-right" target="_blank" href="mailto:<%=email %>?subject=Questions">
                                    <asp:Literal runat="server" ID="LiteralEmailSite"></asp:Literal>
                                </a>
                            </li>
                            <li class="list-group-item">
                                <i class="fa fa-whatsapp"></i>
                                <asp:HyperLink runat="server" ID="LinkWhatsApp" Target="_blank" class="pull-right">
                                    <asp:Literal runat="server" ID="LiteralWhatsApp">XXX
                                    </asp:Literal>
                                </asp:HyperLink>
                            </li>
                            <li class="list-group-item">
                                <i class="fa fa-phone"></i><a class="pull-right">
                                    <asp:Literal runat="server" ID="LiteralTelefone"></asp:Literal></a>
                            </li>
                        </ul>

                        <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>

                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

                <!-- About Me Box -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Sobre</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <strong><i class="fa fa-book margin-r-5"></i>Plano</strong>

                        <p class="text-muted">
                            <asp:Literal runat="server" ID="LiteralPlano"></asp:Literal>
                        </p>

                        <hr>
                        <strong><i class="fa fa-map-marker margin-r-5"></i>Endereço</strong>
                        <p class="text-muted">
                            <asp:Literal ID="LiteralCEP" runat="server"></asp:Literal>
                        </p>
                        <p class="text-muted">
                            <asp:Literal ID="LiteralCidade" runat="server"></asp:Literal>
                        </p>
                        <p class="text-muted">
                            <asp:Literal ID="LiteralEstado" runat="server"></asp:Literal>
                        </p>
                        <p class="text-muted">
                            <asp:Literal ID="LiteralSetor" runat="server"></asp:Literal>
                        </p>
                        <p class="text-muted">
                            <asp:Literal ID="LiteralRua" runat="server"></asp:Literal>
                        </p>
                        <p class="text-muted">
                            <asp:Literal ID="LiteralEndNumero" runat="server"></asp:Literal>
                        </p>

                        <hr>

                        <strong><i class="fa fa-pencil margin-r-5"></i>Skills</strong>

                        <p>
                            <ul>
                                <li runat="server" id="LiFacebookHeader">
                                    <asp:HyperLink runat="server" ID="LinkFacebookHeader" Target="_blank">
                                            <i class="fa fa-facebook-square" title="Facebook" data-original-title="Facebook"></i>
                                            <span class="hidden-sm hidden-xs">
                                                Facebook
                                            </span></asp:HyperLink></li>

                                <li runat="server" id="LiInstagramHeader">
                                    <asp:HyperLink runat="server" ID="LinkInstagramHeader" Target="_blank">
                                            <i class="fa fa-instagram" title="Instagram" data-original-title="Instagram"></i>
                                            <span class="hidden-sm hidden-xs">
                                                Instagram
                                            </span></asp:HyperLink></li>
                                <li runat="server" id="LiYoutubeHeader">
                                    <asp:HyperLink runat="server" ID="LinkYoutubeHeader" Target="_blank">
                                            <i class="fa fa-youtube" title="Youtube" data-original-title="Youtube"></i>
                                            <span class="hidden-sm hidden-xs">
                                                Youtube
                                            </span></asp:HyperLink></li>

                                <li runat="server" id="LiTwitterHeader">
                                    <asp:HyperLink runat="server" ID="LinkTwitterHeader" Target="_blank">
                                            <i class="fa fa-twitter" title="Twitter" data-original-title="Twitter"></i>
                                            <span class="hidden-sm hidden-xs">
                                                Twitter
                                            </span></asp:HyperLink></li>

                                <li runat="server" id="LiLinkedinHeader">
                                    <asp:HyperLink runat="server" ID="LinkLinkedinHeader" Target="_blank">
                                            <i class="fa fa-linkedin" title="Linkedin" data-original-title="Linkedin"></i>
                                            <span class="hidden-sm hidden-xs">
                                                Linkedin
                                            </span></asp:HyperLink></li>
                            </ul>
                        </p>

                        <hr>

                        <strong><i class="fa fa-file-text-o margin-r-5"></i>Sobre</strong>

                        <p>
                            <asp:Literal runat="server" ID="LiteralSobre"></asp:Literal>
                        </p>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#activity" data-toggle="tab">Atendimento</a></li>
                        <li><a href="#timeline" data-toggle="tab">Linha do tempo</a></li>
                        <li><a href="#settings" data-toggle="tab">Configurações</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="active tab-pane" id="activity">

                            <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#modal-default"><b><i class="fa fa-envelope"></i>&nbsp; Enviar & Responder Mensagens</b></button>

                            <div class="modal fade" id="modal-default">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title"><i class="fa fa-envelope"></i>&nbsp; Enviar & Responder</h4>
                                        </div>
                                        <div class="modal-body">
                                            
                                            <asp:TextBox ID="TextBoxMensagemResposta" runat="server" TextMode="MultiLine" class="textarea" placeholder="Digite a mensagem aqui..."
                                                style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></asp:TextBox>
                                           
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Fechar</button>
                                            <button type="button" class="btn btn-primary">Confirmar envio</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->

                            <asp:Repeater ID="RepeaterAtendimento" runat="server">
                                <ItemTemplate>
                                    <!-- Post -->
                                    <div class="post">
                                        <div class="user-block">
                                            <img class="img-circle img-bordered-sm" src="../../dist/img/user1-128x128.jpg" alt="user image">
                                            <span class="username">
                                                <a href="#"><%#Eval("atit_solicitante_id") %></a>
                                                <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i><%#Eval("data_alteracao") %></a>
                                            </span>
                                            <span class="description">Shared publicly - 7:30 PM today</span>
                                        </div>
                                        <!-- /.user-block -->
                                        <p>
                                            <%#Eval("atit_mensagem") %>
                                        </p>
                                        <ul class="list-inline">
                                            <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i>Share</a></li>
                                            <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i>Like</a>
                                            </li>
                                            <li class="pull-right">
                                                <a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i>Comments(5)</a></li>

                                        </ul>

                                        <input class="form-control input-sm" type="text" placeholder="Type a comment">
                                    </div>
                                    <!-- /.post -->
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                        <!-- /.tab-pane -->
                        <div class="tab-pane" id="timeline">
                            <!-- The timeline -->
                            <ul class="timeline timeline-inverse">
                                <!-- timeline time label -->
                                <li class="time-label">
                                    <span class="bg-red">10 Feb. 2014
                                    </span>
                                </li>
                                <!-- /.timeline-label -->
                                <!-- timeline item -->
                                <li>
                                    <i class="fa fa-envelope bg-blue"></i>

                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-clock-o"></i>12:05</span>

                                        <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                                        <div class="timeline-body">
                                            Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                        weebly ning heekya handango imeem plugg dopplr jibjab, movity
                        jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                        quora plaxo ideeli hulu weebly balihoo...
                     
                                        </div>
                                        <div class="timeline-footer">
                                            <a class="btn btn-primary btn-xs">Read more</a>
                                            <a class="btn btn-danger btn-xs">Delete</a>
                                        </div>
                                    </div>
                                </li>
                                <!-- END timeline item -->
                                <!-- timeline item -->
                                <li>
                                    <i class="fa fa-user bg-aqua"></i>

                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-clock-o"></i>5 mins ago</span>

                                        <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request</h3>
                                    </div>
                                </li>
                                <!-- END timeline item -->
                                <!-- timeline item -->
                                <li>
                                    <i class="fa fa-comments bg-yellow"></i>

                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-clock-o"></i>27 mins ago</span>

                                        <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                                        <div class="timeline-body">
                                            Take me to your leader!
                        Switzerland is small and neutral!
                        We are more like Germany, ambitious and misunderstood!
                     
                                        </div>
                                        <div class="timeline-footer">
                                            <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                                        </div>
                                    </div>
                                </li>
                                <!-- END timeline item -->
                                <!-- timeline time label -->
                                <li class="time-label">
                                    <span class="bg-green">3 Jan. 2014</span>
                                </li>
                                <!-- /.timeline-label -->
                                <!-- timeline item -->
                                <li>
                                    <i class="fa fa-camera bg-purple"></i>

                                    <div class="timeline-item">
                                        <span class="time"><i class="fa fa-clock-o"></i>2 days ago</span>

                                        <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                                        <div class="timeline-body">
                                            <img src="http://placehold.it/150x100" alt="..." class="margin">
                                            <img src="http://placehold.it/150x100" alt="..." class="margin">
                                            <img src="http://placehold.it/150x100" alt="..." class="margin">
                                            <img src="http://placehold.it/150x100" alt="..." class="margin">
                                        </div>
                                    </div>
                                </li>
                                <!-- END timeline item -->
                                <li>
                                    <i class="fa fa-clock-o bg-gray"></i>
                                </li>
                            </ul>
                        </div>
                        <!-- /.tab-pane -->

                        <div class="tab-pane" id="settings">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">Name</label>

                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="inputName" placeholder="Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">Name</label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputName" placeholder="Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputExperience" class="col-sm-2 control-label">Experience</label>

                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputSkills" class="col-sm-2 control-label">Skills</label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox">
                                                I agree to the <a href="#">terms and conditions</a>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-danger">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.nav-tabs-custom -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

    </section>
    <!-- /.content -->


</asp:Content>

