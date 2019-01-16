# frozen_string_literal: true

require 'dotenv' # Appelle la gem Dotenv
require 'pry' # Appelle la gem pry
require 'twitter' # Appelle la gem twitter

journalists = ['@jcunniet', '@Aziliz31', '@ssoumier', '@marionsouzeau', '@gaellombart', '@bendarag', '@AurelieLebelle', '@julienduffe', '@thomaspoupeau', '@LilyRossignol', '@ClairGuedon', '@stephanieauguy', '@claw_prolongeau', '@_JulieMenard', '@LColcomb', '@Zlauwereys', '@MeLonguet', '@DorotheeLN', '@NolwennCosson', '@ADaboval', '@Remibaldy', '@bderveaux', '@amandechap', '@ELODIESOULIE', '@nbongarcon', '@HeloAb', '@gregplou', '@BenoitBerthe', '@LauraBruneau89', '@Anthony_Lieures', '@Sharonwaj', '@mcsonkin', '@pverduzier', '@emiliel3', '@Julien_MARION', '@SophiFay', '@bdelombre', '@annalecerf', '@AdriaBudry', '@DejNikolic', '@iJaffre', '@CyrusleVirus', '@GPardigon', '@e_vallerey', '@IsabelleSouquet', '@AudeDavidRossi', '@Yoann_Pa', '@CeliaPenavaire', '@perraultvincent', '@cboulate', '@JustineWeyl', '@Paulinejacot', '@juliechab', '@aslechevallier', '@phnou', '@Seb_Pommier', '@Alex_Bensaid', '@GuillaumeGaven', '@annelaurechouin', '@Oliviader', '@guerricp', '@JMMarchaut', '@cyceron', '@gregory_raymond', '@vhunsinger', '@l_peillon', '@fannyguinochet', '@EAssayag', '@YvonHerry', '@JohanGarciajg', '@saidlabidi', '@lauranneprov', '@LeaDavy', '@francois_remy', '@CGuicheteau', '@FloMaillet', '@m_perroud', '@oBrunet_TSMF', '@MoonVdc', '@jc2taille', '@NellyMoussu', '@VirginK', '@b_misa', '@FabriceCouste', '@barbara_prose', '@lelia2m', '@brunoaskenazi', '@laurenechamp', '@ysisbox', '@juliengagliardi', '@PierreLel', '@kdeniau', '@_TerraInc', '@DominicArpin', '@antoinfonteneau', '@nanotousch', '@jb_roch', '@YaniKhezzar', '@Anne_Bechet', '@NCapart', '@SamyBenNaceur', '@Joumany', '@Julietteraynal', '@TGiraudet', '@SaraTanit', '@HappeFrederic', '@antoinellorca', '@michelpicot', '@Sev_Ryne', '@bobdobolino', '@murdever', '@YGrandmontagne', '@Mnyo', '@EdKOSCIANSKI', '@tnoisette', '@jankari', '@delbello_rom', '@rflechaux', '@NadiaSorelli', '@IT_Digital', '@abarbaux', '@PhilippeLeroy', '@schaptal', '@marionspee', '@lisavignoli', '@ChloeAeberhardt', '@MartineJacot', '@JuliaPascualita', '@curieusedetout', '@sgraveleau', '@bif_o', '@zinebdryef', '@apiquard', '@pierrehaski', '@StephanieDelmas', '@Blandine_Garot', '@vergara_i', '@evan_lebastard', '@SophieVclt', '@OlivierLevrault', '@alicedorgeval', '@LouiseMalnoy', '@alix_fx', '@pierre_baudis', '@LucMagoutier', '@AgatheMuller', '@SGianninelli', '@PaulineBoyer33', '@NaomiHalll', '@romaindlx', '@marionbr', '@Burtschy', '@JacobEtienne', '@as_lizzani', '@marie_simon', '@LaureDaussy', '@FabriceAmedeo', '@LoubnaChlaikhy', '@PlummerWilliam', '@OlivierMarin1', '@alaurefremont', '@mwesfreid', '@ChBaDe', '@pmathon', '@theobaldmarie', '@Lnpagesy', '@marclandre', '@paoliniesther', '@Feertchak', '@JBLitzler', '@GuillaumeErrard', '@quentinperinel', '@TristanQM', '@mlbo', '@constancejamet', '@LoraTerrazas', '@emiliegeffray', '@Mathilde_Sd', '@CaroPiquet', '@DCanivez', '@TIM_7375', '@blandinelc', '@ivanrioufol', '@arthurberdah', '@SarahLecoeuvre', '@guillaume_gui', '@DamienMercereau', '@W_Chloe', '@Assma_MD', '@EugenieBastie', '@HiTech_lexpress', '@bcondominas', '@Laurie_Z_', '@jeanfrancgerard', '@MathieuPagura', '@BGUYF', '@AlainPiffaretti', '@AudreyKucinskas', '@julienhory', '@Pierrefalga', '@TiphThuillier', '@cdaniez', '@LigerBaptiste', '@D_Peras', '@julie_dlb', '@julian2lamancha', '@GaetaneDeljurie', '@JulianMattei', '@M_Vicuna', '@DeBruynOlivier', '@Nehed_Jendoubi', '@antoine_grenapi', '@ColonnaGen', '@VictoriaGairin', '@Clement_Lacombe', '@TVigoureux', '@MargauxObriot', '@solinedelos', '@RocheSabine', '@dangerkens', '@EdouardDutour', '@MDondeyne', '@DupuisNathalie1', '@bouscarel', '@Mathieu2jean', '@Sophie_T_J', '@laurentcalixte', '@patrockwilliams', '@PascaleKremer', '@AlexJaquin', '@LauraIsaaz', '@cath_robin', '@Del_Gautherin', '@Isaduriez', '@lucietuile', '@AugeyBastien', '@mcastagnet', '@AminaKalache', '@mvaudano', '@CParrot', '@ombelinetips', '@_JoinLion', '@BarbolosiRose', '@ToiBruno1', '@FloraClodic', '@xjbdx', '@AlexiaEy', '@Emjy_STARK', '@elcoco01', '@rabilebon', '@pflovens_', '@FabriceFrossard', '@MorganeSERRES', '@MarjolaineKoch', '@edgarsnow', '@SRNLF', '@CChassigneux', '@NassiraELM', '@NewsRicard', '@Sandreene', '@Emilezrt', '@Pierre_Do', '@Micode', '@CColumelli', '@DavidAbiker', '@ClementBergantz', '@benjaminrabier', '@celinekallmann', '@edwyplenel', '@C_Barbier', '@JJBourdin_RMC', '@LaurenceFerrari', '@aslapix', '@IsaMillet', '@MaximeSwitek', '@tomjoubert', '@jszanchi', '@roqueeva', '@XavierBiseul', '@florencesantrot', '@AntoineCrochet', '@freeman59', '@MaudeML', '@philippe_gulpi', '@mathieum76', '@kiouari', '@imanemoustakir', '@BenedicteMallet', '@Emilie_Brouze', '@antoinebarret', '@_nicolasbocquet', '@remibuhagiar', '@CourretB', '@AymericRobert', '@miraelmartins', '@pmaniere', '@jesuisraphk', '@David_Ingram', '@pcelerier', '@technomedia', '@Geraldinedauver', '@ThierryLabro', '@Newsdusud', '@nrauline', '@gbregeras', '@SCouasnonBFM', '@actualites_nrv', '@dimitrimoulins', '@oli_aura', '@FabieChiche', '@Vincent_Raimblt', '@ChristophGreuet', '@PAlbuchay', '@MarrauddesGrot', '@vtalmon', '@cedric', '@olivierfrigara', '@Julien_Jay', '@LydiaBerroyer', '@Shuua', '@datisdaz', '@Steuph', '@ameliecharnay', '@Bruno_LesNums', '@LelloucheNico', '@CciliaDiQuinzio', '@Elodie_C', '@SylvRolland', '@Kocobe', '@FL_Debes', '@jdupontcalbo', '@GarciaVictor_', '@NicoRichaud', '@RHoueix', '@simottel', '@DamienLicata', '@annabelle_L', '@Lea_Lejeune', '@axel_deb', '@marin_eben', '@ptiberry', '@MatthieuDelach', '@sandrinecassini', '@benjaminferran', '@ppgarcia75', '@NotPatrick', '@ivalerio', '@FabienneSchmitt', '@alexgoude', '@JeromeColombain', '@manhack', '@Capucine_Cousin', '@Fsorel', '@oliviertesquet', '@marjoriepaillon', '@ginades', '@PierreTran', '@DelphineCuny', '@reesmarc', '@lauratenoudji', '@ldupin', '@carolinedescham', '@Lucile_Quillet', '@cgabizon', '@Allocab', '@epenser', '@JAGventeprivee', '@frwrds', '@Laure__Bourdon', '@Xavier75', '@maximeverner', '@s_jourdain']

Dotenv.load # Ceci appelle le fichier .env grâce à la gem Dotenv, et importe toutes les données enregistrées dans un hash ENV

def login_twitter # me log sur twitter en récupérant les clés dans le fichier .env
  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
  end
  client
end

def find_5_random_journalists(array)
  selected_journalists = [] # creation of an array of selected journalists
  5.times do
    prng = Random.new
    selected_journalists << array[prng.rand(0..49)]
  end
  selected_journalists # return the selected journalists
end

def tweet_all_users_in_an_array(array)
  array.each do |journalist|
    puts journalist
    login_twitter.update("#{journalist}, comment allez-vous ? j'apprends à coder avec @the_hacking_pro")
  end
end

def like_hello_world(client, string, nb) # liker à partir d'un client, selon un certain string et un nombre de fois
  client.search(string, result_type: 'recent').take(nb).collect do |i| # recherche les plus récents tweets qui contiennent le string et prend les nb derniers, puis les collecte
    client.favorite(i.id) # je les fav grâce à l'id du Tweet
    puts i.user.screen_name
  end
end

def follow_hello_world(client, string, nb)
  client.search(string, result_type: 'recent').take(nb).collect do |i| # recherche les plus récents tweets qui contiennent le string et prend les nb derniers, puis les collecte
    client.follow(i.user.screen_name) #follow les gens en récupérant leur username
    puts i.user.screen_name
  end
end

def garcia_resignation
  array = ['SergentGarcia, niqué par Zoro', '#parsmaislaissetafilleagain', 'kostastoipovcon', 'Mourinho à Marseille', '@FinallyMario balaye le']
  array.each do |insult|
    puts "#GarciaDemission #{insult} Hé @FloxoS, tu kiffes ? "
    login_twitter.update("#GarciaDemission #{insult} Hé @FloxoS, tu kiffes ? ")
  end
end

def login_twitter_streaming 
  client = Twitter::Streaming::Client.new do |config|  # Changement de REST par Streaming pour pouvoir l'utiliser en live
    config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
  end
  client
end

def stream_string(string)
  puts string
  login_twitter_streaming.filter(track: topics) do |tweet|
    puts 'TWEET REPERE'
    puts '============='
    puts "Tweet de #{tweet.user.screen_name}"
    puts tweet.text
    login_twitter.favorite(tweet.id)
  end
end

# http://luanotes.com/posts/twitter-streaming-apis-with-ruby pour voir avec des tableaux

stream_string('#GenesioDemission')

# garcia_resignation
# like_hello_world(login_twitter,'#bonjour_monde',12) #like les 25 derniers tweets contenant "#bonjour_monde"
# tweet_all_users_in_an_array(find_5_random_journalists(journalists))
# follow_hello_world(login_twitter, '#bonjour_monde',10)
