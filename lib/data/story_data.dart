import '../models/story.dart';

final sharedFinalCard = StoryFinalCard(
  background: assetPath('/story-1-scene-17-background-motion.webp'),
  dog: assetPath('/story-1-scene-17-dog-motion.webp'),
);

final friendshipQuiz = <QuizQuestion>[
  QuizQuestion(
    question: "Sino-sino ang magkakaibigang naglalaro ng basketball?",
    answers: <String>["Josh, Ben, Mark, at Jake", "Josh, Ben, at Rosa", "Jake, Mark, at Rosa"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: "Ano ang pinag-awayan nina Josh at Jake?",
    answers: <String>["Bola", "Sapatos", "Laruan"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: "Ano ang ginawa nina Josh at Jake dahil sa kanilang galit?",
    answers: <String>["Nagtulakan", "Tumakbo", "Tumawa"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: "Sino ang pumigil sa kanilang pag-aaway?",
    answers: <String>["Ginang Rosa", "Ben", "Mark"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: "Ano ang natutunan nila mula sa nangyari?",
    answers: <String>["Agawin ang bola", "Laging makipag-away", "Mag-usap nang mahinahon"],
    correctAnswer: 2,
  ),
];

final ezrahQuiz = <QuizQuestion>[
  QuizQuestion(
    question: "Sino si Ezrah at ano ang natatangi sa kaniya?",
    answers: <String>["Siya ay guro na hindi nakakakita", "Siya ay bagong estudyante na bulag", "Siya ay bagong estudyante na hindi makalakad"],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: "Bakit ayaw isali ng ilang kaklase si Ezrah sa kanilang grupo?",
    answers: <String>["Dahil inakala nilang hindi niya kayang gawin ang gawain dahil siya ay bulag", "Dahil ayaw nilang makipagkaibigan sa kaniya", "Dahil hindi marunong makinig si Ezrah"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: "Ano ang natuklasan ng mga kaklase ni Ezrah habang nagtutulungan sila?",
    answers: <String>["Mas gusto niyang laging mag-isa", "Hindi niya kayang gumawa ng kuwento", "Marami siyang magagandang ideya at mahusay siyang magsalaysay at makinig"],
    correctAnswer: 2,
  ),
  QuizQuestion(
    question: "Ano ang ibig sabihin ng ‘kilalanin muna ang isang tao bago manghusga’?",
    answers: <String>["Husgahan agad ang tao batay sa kaniyang hitsura", "Iwasan ang taong may kapansanan", "Alamin muna ang kakayahan at pagkatao ng isang tao bago bumuo ng opinyon tungkol sa kaniya"],
    correctAnswer: 2,
  ),
  QuizQuestion(
    question: "Paano mo maipapakita ang paggalang at pagtanggap sa isang taong may kapansanan?",
    answers: <String>["Isama siya sa mga gawain at tratuhin siya nang may respeto", "Iwasan siyang kausapin upang hindi siya mahirapan", "Huwag siyang isali dahil baka hindi niya kayanin"],
    correctAnswer: 0,
  ),
];

final evaQuiz = <QuizQuestion>[
  QuizQuestion(
    question: "Sino ang dalawang magkakaibigan sa kuwento?",
    answers: <String>["Eva at Gaby", "Eva at Mama Liza", "Gaby at Papa Noel"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: "Ano ang mga paboritong asignatura nina Eva at Gaby?",
    answers: <String>["Math at English", "Science at Filipino", "MAPEH at History"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: "Paano nagtutulungan sina Eva at Gaby sa kanilang pag-aaral?",
    answers: <String>["Naglalaro sila habang nag-aaral", "Tinutulungan nila ang isa’t isa sa mga asignaturang nahihirapan sila", "Gumagawa sila ng proyekto nang magkahiwalay"],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: "Ano ang natutuhan ni Eva tungkol sa pamilya?",
    answers: <String>["Ang pamilya ay dapat laging magkakasama", "Ang pamilya ay nabubuo lamang sa dugo", "Ang pamilya ay nabubuo rin sa pagmamahal, pagtanggap, at pag-aalaga"],
    correctAnswer: 2,
  ),
  QuizQuestion(
    question: "Paano ipinakita nina Mama Liza at Papa Noel ang pag-aalaga kay Eva?",
    answers: <String>["Pinapakain, inaalagaan, at pinoprotektahan nila si Eva", "Pinapagalitan nila si Eva kapag bumibisita", "Hindi nila pinapansin si Eva"],
    correctAnswer: 0,
  ),
];

final leviQuiz = <QuizQuestion>[
  QuizQuestion(
    question: "Ano ang paboritong inaabangan ni Levi tuwing pumapasok siya sa paaralan?",
    answers: <String>["Kainin ang kaniyang baon", "Maglaro", "Matulog tuwing recess"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: "Ano ang ginawa ng grupo ng mga lalaki sa baon ni Levi?",
    answers: <String>["Kinuha", "Dinagdagan", "Nakihati"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: "Bakit natakot si Levi na magsumbong?",
    answers: <String>["Dahil masaya silang naglaro", "Dahil binalaan siya ng kaniyang mga kaklase na huwag magkalat at magsumbong", "Dahil bati na sila"],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: "Kanino nagsabi si Levi tungkol sa nangyayari sa kaniya?",
    answers: <String>["Ginoong Cruz", "Ginang Gomez", "Ang kaniyang ina"],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: "Kung may kakilala kang nakararanas ng bullying, ano ang maaari mong gawin upang matulungan siya?",
    answers: <String>["Pabayaan na lamang", "Makisali sa mga batang nang-aapi sa kaniya.", "Isumbong ang katotohanan sa magulang, guro, o awtoridad"],
    correctAnswer: 2,
  ),
];

final anyaQuiz = <QuizQuestion>[
  QuizQuestion(
    question: "Ano ang madalas gawin ni Anya pagkatapos umuwi mula sa paaralan?",
    answers: <String>["Agad siyang lumabas at makipaglaro", "Agad siyang natutulog", "Tumutulong muna siya sa kaniyang ina"],
    correctAnswer: 2,
  ),
  QuizQuestion(
    question: "Sino ang naiwan sa bahay upang gumawa ng mga gawaing-bahay?",
    answers: <String>["Ang kaniyang ina", "Si Sofia", "Kaniyang mga kaibigan"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: "Ano ang ginawa ni Anya nang makita niyang pagod ang kaniyang mama?",
    answers: <String>["Nagpatuloy siyang maglaro", "Natulog lamang siya", "Tumulong siya sa mga gawaing-bahay"],
    correctAnswer: 2,
  ),
  QuizQuestion(
    question: "Ano ang natutuhan ni Anya tungkol sa pagtulong sa bahay?",
    answers: <String>["Kailangang utusan muna bago kumilos", "Hindi kailangang utusan bago tumulong sa gawaing-bahay", "Unahin ang paglalaro kesa tumulong"],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: "Paano mo maipapakita ang pagiging responsable at mapagmahal na miyembro ng pamilya?",
    answers: <String>["Tumulong sa mga gawaing-bahay kahit hindi inuutusan", "Maglaro buong araw at iwasang tumulong", "Hintaying utusan muna bago gumawa ng anumang gawain"],
    correctAnswer: 0,
  ),
];

final taraQuiz = <QuizQuestion>[
  QuizQuestion(
    question: "Sino ang kaibigan ni Dwayne bago niya nakilala ang bago niyang mga kaibigan?",
    answers: <String>["Jasmine", "Clara", "Mia"],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: "Ano ang naramdaman ni Clara noong bago pa lamang siya napakilala sa bagong mga kaibigan ni Dwayne?",
    answers: <String>["Masaya", "Malungkot", "Nahiya"],
    correctAnswer: 2,
  ),
  QuizQuestion(
    question: "Ano ang ginawa nila upang malutas ang hindi pagkakaunawaan tungkol sa laruan?",
    answers: <String>["Wala lang", "Nagusap", "Binaliwala ang isat-isa"],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: "Paano sinuportahan ng magkakaibigan si Jasmine nang may problema siya?",
    answers: <String>["Umiyak sila", "Naglaro sila", "Nagdasal sila"],
    correctAnswer: 2,
  ),
  QuizQuestion(
    question: "Bakit mahalagang pag-usapan ang problema kaysa magalit o umiwas sa kaibigan?",
    answers: <String>["Upang ito ay pag-usapan nang masama", "Upang ito ay makalimutan", "Upang ma unawaan ang isat-isa"],
    correctAnswer: 2,
  ),
];

final stories = <Story>[
  Story(
    title: "Sa Bola May Pagkakaibigan",
    image: assetPath("/story-1.png"),
    cover: assetPath("/story-1-start.png"),
    scenes: <StoryScene>[
      StoryScene(image: assetPath("/story-1-scene-1.png"), narration: "Isang hapon, nang tumunog ang bell at oras na ng uwian, masayang lumabas ang magkakaibigang sina Josh, Ben, Mark, at Jake."),
      StoryScene(image: assetPath("/story-1-scene-2.png"), narration: "Napagpasiyahan nilang maglaro ng basketball at agad na pumunta sa palaruan ng paaralan."),
      StoryScene(image: assetPath("/story-1-scene-3.png"), narration: "Habang sila ay naglalaro, naipasa ang bola sa puwesto nina Josh at Jake. Pareho silang agad na tumakbo upang kunin ito."),
      StoryScene(image: assetPath("/story-1-scene-4.png"), narration: "\"Akin na ang bola!\" sigaw ni Josh."),
      StoryScene(image: assetPath("/story-1-scene-5.png"), narration: "\"Hindi! Ako ang unang nakakuha kaya akin ito!\" sagot naman ni Jake."),
      StoryScene(image: assetPath("/story-1-scene-6.png"), narration: "Pareho nilang hinawakan ang bola at pinag-agawan ito. \"Akin na sabi eh! Hindi ka namang masyadong marunong!\" galit na sabi ni Josh."),
      StoryScene(image: assetPath("/story-1-scene-7.png"), narration: "Ayaw nilang bitawan ang bola kaya nagtulakan sila. Lalong uminit ang tensyon at muntik nang magsuntukan hanggang sa sinita sila ng guro."),
      StoryScene(image: assetPath("/story-1-scene-8.png"), narration: "\"Jake at Josh, anong nangyayari? Tama na, bitawan ninyong dalawa ang bola,\" sabi ni Ginang Rosa habang pinaghihiwalay sila."),
      StoryScene(image: assetPath("/story-1-scene-9.png"), narration: "Tahimik at mahinahon na naupo ang dalawang sa gilid na mga upuan. Ipinaliwanag ng kanilang guro na hindi naman kailangang pag-awayan ang isang bola."),
      StoryScene(image: assetPath("/story-1-scene-10.png"), narration: "\"Bakit hindi kayo mag-usap nang mahinahon?\" tanong ni Ginang Rosa. Napayuko naman sina Josh at Jake dahil sa pagsisisi."),
      StoryScene(image: assetPath("/story-1-scene-11.png"), narration: "\"Maaari naman kayong magpalitan, di ba? Kung sino ang unang nakakuha, maaaring ang isa naman ang sumunod,\" sabi ng guro."),
      StoryScene(image: assetPath("/story-1-scene-12.png"), narration: "Napaisip sina Josh at Jake. Napagtanto nilang mali ang kanilang ginawa."),
      StoryScene(image: assetPath("/story-1-scene-13.png"), narration: "\"Pasensya ka na, Jake. Hindi na sana kita tinulak at inagawan ng bola,\" sabi ni Josh nang may pagpapakumbaba."),
      StoryScene(image: assetPath("/story-1-scene-14.png"), narration: "\"Pasensya ka na rin, Josh. Hindi ko rin napigilan ang inis ko,\" sagot ni Jake."),
      StoryScene(image: assetPath("/story-1-scene-15.png"), narration: "Nagkamayan ang dalawa at nangakong hindi na sila mag-aaway dahil lamang sa isang laro."),
      StoryScene(image: assetPath("/story-1-scene-16.png"), narration: "Natutunan nina Jake at Josh na kontrolin ang kanilang galit, makipaglaro nang patas, at idaan sa mahinahong pag-uusap ang isang problema upang hindi ito mauwi sa pananakit."),
      StoryScene(image: assetPath("/story-1-scene-17.png"), narration: "Dapat nating kontrolin ang ating galit at lutasin ang mga problema sa mahinahong pag-uusap sa halip na pananakit o pakikipag-away."),
    ],
    quiz: friendshipQuiz,
    finalCard: sharedFinalCard,
  ),
  Story(
    title: "Ang Paboritong Baon ni Levi",
    image: assetPath("/story-2.jpg"),
    cover: assetPath("/story-2-cover.png"),
    scenes: <StoryScene>[
      StoryScene(image: assetPath("/story-2-scene-1.png"), narration: "Si Levi ay masipag at mapagmahal na anak. Paborito niya ang luto ng kaniyang ina kaya lagi niyang inaabangan ang kaniyang baon."),
      StoryScene(image: assetPath("/story-2-scene-2.png"), narration: "Pakiramdam ni Levi ay hindi buo ang araw niya kapag hindi niya nakakain ang baon na inihanda ng kaniyang ina."),
      StoryScene(image: assetPath("/story-2-scene-3.png"), narration: "Ngunit isang araw, habang kumakain siya sa oras ng recess, nilapitan siya ng grupo ng mga lalaking kaklase niya."),
      StoryScene(image: assetPath("/story-2-scene-4.png"), narration: "Hoy, Levi, ang sarap naman ng baon mo. Puwede hingin na lang namin? Mukhang marami ka nang nakain. Ibigay mo na lang sa amin, sabi nila. Ah, puwede naman, pero kaunti lang dahil ulam ko na ito sa tanghalian mamaya, sagot ni Levi."),
      StoryScene(image: assetPath("/story-2-scene-5.png"), narration: "Ang damot mo naman! sigaw ng isa sa mga lalaki habang inaagaw ang pagkain."),
      StoryScene(image: assetPath("/story-2-scene-6.png"), narration: "Ito na lang, may isa pa akong burger. Sa inyo na iyan, sabi ni Levi, umaasang matatapos na ang pangungulit nila."),
      StoryScene(image: assetPath("/story-2-scene-7.png"), narration: "Iyong ulam nga, iyong gusto namin eh, giit ng mga kaklase niya."),
      StoryScene(image: assetPath("/story-2-scene-8.png"), narration: "Bawal mong sabihin ito sa kahit kanino. Kapag nalaman kong may pinagsabihan ka, malalagot ka sa amin, pagbabanta nila."),
      StoryScene(image: assetPath("/story-2-scene-9.png"), narration: "Mula noon, palaging kinukuha ng mga lalaki ang baon ni Levi. Natatakot siyang magsumbong dahil sa kanilang mga banta, kaya madalas siyang nagugutom at napansin ito ng guro."),
      StoryScene(image: assetPath("/story-2-scene-10.png"), narration: "Levi, kain na. Bakit parang wala ka nang dalang baon? tanong ni Ginang Gomez. Ginang Gomez, araw-araw po nilang kinukuha ang baon ko at tinatakot nila akong magsabi sa inyo, sagot ni Levi."),
      StoryScene(image: assetPath("/story-2-scene-11.png"), narration: "Mabuti at sinabi mo sa akin, Levi. Hindi mo kailangang matakot o harapin ang ganitong problema nang mag-isa, sabi ni Ginang Gomez. Agad siyang pinakinggan at binigyan ng pagkain."),
      StoryScene(image: assetPath("/story-2-scene-12.png"), narration: "Kinausap ng guro ang mga batang sangkot at ipinaalam ang nangyari sa kanilang mga magulang."),
      StoryScene(image: assetPath("/story-2-scene-13.png"), narration: "Humingi ng tawad ang mga bata kay Levi at nangakong hindi na nila ito uulitin."),
      StoryScene(image: assetPath("/story-2-scene-14.png"), narration: "Hindi na muling natakot si Levi na magsabi kapag may nangyayaring hindi tama. Natutuhan din niyang hindi masamang humingi ng tulong."),
      StoryScene(image: assetPath("/story-2-final.png"), narration: "Huwag matakot humingi ng tulong sa mga guro o magulang kapag nakararanas ng pambubully at hindi tamang pagtrato. Ipinapaalala rin nito na maling gawain ang pang-aagaw ng gamit at pananakot sa kapwa."),
    ],
    quiz: leviQuiz,
    finalCard: sharedFinalCard,
  ),
  Story(
    title: "Habang Nakapikit Ang Aking Mata",
    image: assetPath("/story-3.png"),
    cover: assetPath("/story-3-cover.png"),
    scenes: <StoryScene>[
      StoryScene(image: assetPath("/story-3-scene-1.png"), narration: "Si Ezrah ay isang bagong estudyante sa kanilang paaralan. Siya ay mabait, masipag, at mahilig makinig sa kuwento ng kanyang mga guro."),
      StoryScene(image: assetPath("/story-3-scene-2.png"), narration: "Ngunit may isang bagay na natatangi sa kanya: si Ezrah ay bulag."),
      StoryScene(image: assetPath("/story-3-scene-3.png"), narration: "Bakit may tungkod siya? bulong ng isang kaklase."),
      StoryScene(image: assetPath("/story-3-scene-4.png"), narration: "Baka hindi niya kayang gawin ang mga ginagawa natin, sagot naman ng isa."),
      StoryScene(image: assetPath("/story-3-scene-5.png"), narration: "Narinig iyon ni Ezrah, ngunit hindi siya nagsalita. Sanay na siyang may mga taong hindi nakauunawa sa kanyang kalagayan."),
      StoryScene(image: assetPath("/story-3-scene-6.png"), narration: "Tuwing recess, mag-isa siyang kumakain. Kapag may group activity, minsan ay hindi siya isinasama ng kanyang mga kaklase."),
      StoryScene(image: assetPath("/story-3-scene-7.png"), narration: "Isang araw, nagbigay ng gawain ang kanilang guro. Bumuo kayo ng grupo at gumawa ng maikling kuwento, sabi ni Ginang Maria."),
      StoryScene(image: assetPath("/story-3-scene-8.png"), narration: "Nagkatinginan ang mga estudyante. Walang lumapit kay Ezrah."),
      StoryScene(image: assetPath("/story-3-scene-9.png"), narration: "Ma'am, hindi po namin isasali si Ezrah kasi baka hindi po siya makagawa kasi hindi niya kaya iyon. Hindi naman po kasi siya nakakakita, sabi ng isang kaklase. Napayuko si Ezrah."),
      StoryScene(image: assetPath("/story-3-scene-10.png"), narration: "Ngunit agad na nagsalita ang kanilang guro. Hindi nakikita ni Ezrah gamit ang kanyang mga mata, pero hindi ibig sabihin na wala siyang kakayahan, mahinahong sabi ni Gng. Maria."),
      StoryScene(image: assetPath("/story-3-scene-11.png"), narration: "Tahimik ang buong klase. Alam niyo ba kung ano ang kailangan ng isang kaibigan? tanong ng guro."),
      StoryScene(image: assetPath("/story-3-scene-12.png"), narration: "Kailangan natin siyang kilalanin at huwag agad siyang husgahan."),
      StoryScene(image: assetPath("/story-3-scene-13.png"), narration: "Maya-maya, tinanong ng isang kaklase si Ezrah. Ezrah, gusto mo bang sumali sa grupo namin?"),
      StoryScene(image: assetPath("/story-3-scene-14.png"), narration: "Napangiti si Ezrah sa narinig. Oo naman. Masaya akong makasama kayo."),
      StoryScene(image: assetPath("/story-3-scene-15.png"), narration: "Habang ginagawa nila ang kanilang kuwento, napansin ng mga kaklase ni Ezrah na marami siyang magagandang ideyang ibinahagi sa grupo. Magaling din siyang magsalaysay at makinig."),
      StoryScene(image: assetPath("/story-3-scene-16.png"), narration: "Nahiya ang ilan sa kanila sa kanilang mga sinabi noon. Ezrah, pasensya ka na. Akala namin hindi mo kayang gawin ang mga gawain natin, sabi ng isang kaklase."),
      StoryScene(image: assetPath("/story-3-scene-17.png"), narration: "Okay lang, sanay naman na akong laging nakakarinig ng ganoon. Pero sana sa susunod, kung makakakilala kayo ng taong may kapansanan tulad ko, kilalanin niyo muna sila bago manghusga, sagot ni Ezrah."),
      StoryScene(image: assetPath("/story-3-scene-18.png"), narration: "Tumango ang kaniyang mga kaklase."),
      StoryScene(image: assetPath("/story-3-scene-19.png"), narration: "Mula noon, mas naging maingat sila sa kanilang mga salita at kilos. Natutunan nila na hindi hadlang ang kapansanan upang maging mabuting kaibigan at mahusay na kaklase."),
      StoryScene(image: assetPath("/story-3-scene-20.png"), narration: "Huwag agad manghusga batay sa kapansanan o pagkakaiba ng isang tao. Kilalanin muna siya, pahalagahan ang kaniyang kakayahan, at tratuhin ang lahat nang may respeto, kabaitan, at pagtanggap."),
    ],
    quiz: ezrahQuiz,
    finalCard: sharedFinalCard,
  ),
  Story(
    title: "Ang Hindi Inaasahang Pamilya ni Eva",
    image: assetPath("/story-4.png"),
    cover: assetPath("/story-4-cover.png"),
    scenes: <StoryScene>[
      StoryScene(image: assetPath("/story-4-scene-1.png"), narration: "Mahilig siyang mag-aral at paborito niya ang Math. Magaling din siyang sumayaw at madalas siyang sumali sa mga paligsahan sa paaralan."),
      StoryScene(image: assetPath("/story-4-scene-2.png"), narration: "Ang matalik niyang kaibigan naman na si Gaby ay mahusay sa English at History."),
      StoryScene(image: assetPath("/story-4-scene-3.png"), narration: "Kapag malapit ang pagsusulit, pumupunta si Eva kay Gaby para sabay silang mag-aral at gumawa ng gawain. Masaya silang nagtutulungan. Kapag may hindi naiintindihan ang isa, matiyaga nila itong ipapaliwanag sa isa't isa."),
      StoryScene(image: assetPath("/story-4-scene-4.png"), narration: "Madalas ding pinapaalalahanan ni Papa Noel si Eva na mag-ingat sa pag-uwi. Kapag umuulan, minsan ay hinahatid pa siya pauwi sa kanilang bahay."),
      StoryScene(image: assetPath("/story-4-scene-5.png"), narration: "Napangiti si Eva, dahil napagtanto niyang may mga taong nagmamahal at tumatanggap sa kanya na parang sariling anak."),
      StoryScene(image: assetPath("/story-4-scene-5.png"), narration: "Ang tunay na pamilya ay nabubuo hindi lamang sa dugo, kundi sa pagmamahal, pagtanggap, at pag-aalaga sa isa't isa."),
    ],
    quiz: evaQuiz,
    finalCard: sharedFinalCard,
  ),
  Story(
    title: "Si Anya Anyaya",
    image: assetPath("/story-5.jpg"),
    cover: assetPath("/story-5-cover.webp"),
    scenes: <StoryScene>[
      StoryScene(image: assetPath("/story-5-scene-1.webp"), narration: "Tuwing uwian, masayang naglalakad si Anya galing sa paaralan dahil sabik siyang makipaglaro sa mga kaibigan."),
      StoryScene(image: assetPath("/story-5-scene-2.webp"), narration: "Pagkauwi niya sa bahay, inilalapag niya lamang ang kaniyang bag."),
      StoryScene(image: assetPath("/story-5-scene-3.webp"), narration: "Agad siyang lumalabas ng bahay upang ayain maglaro ang mga bata sa kapitbahay."),
      StoryScene(image: assetPath("/story-5-scene-4.webp"), narration: "Sofia! Ang ganda niyan, bagong laruan mo ba iyan? Laro tayo! aya ni Anya na tinutukoy ang hawak-hawak ni Sofia."),
      StoryScene(image: assetPath("/story-5-scene-5.webp"), narration: "Oo, ang ganda di ba? Halika! masayang sagot ni Sofia."),
      StoryScene(image: assetPath("/story-5-scene-6.webp"), narration: "Habang naglalaro ang magkakaibigan, ang ina naman ni Anya ay abala sa paggawa ng mga gawaing-bahay."),
      StoryScene(image: assetPath("/story-5-scene-7.webp"), narration: "Umuwi lamang si Anya kapag tinatawag siya para sa oras ng hapunan."),
      StoryScene(image: assetPath("/story-5-scene-8.webp"), narration: "Pagkatapos nilang kumain, maya-maya pa ay natulog na agad si Anya sa pagod mula sa eskwela at paglalaro."),
      StoryScene(image: assetPath("/story-5-scene-9.webp"), narration: "Isang hapon, pagdating ni Anya mula sa paaralan ay nakita niyang naglilinis ng bahay ang kaniyang ina at napansin niyang mukhang pagod na ito sa kaniyang ginagawa."),
      StoryScene(image: assetPath("/story-5-scene-10.webp"), narration: "Napaisip si Anya dahil dati ay hindi niya napapansin ang mga ginagawa ng kaniyang ina araw-araw."),
      StoryScene(image: assetPath("/story-5-scene-11.webp"), narration: "Nagwalis si Anya ng sahig, iniligpit ang mga laruan, nagtupi ng mga damit, at inayos ang mga gamit sa sala."),
      StoryScene(image: assetPath("/story-5-scene-12.webp"), narration: "Nang matapos siya sa paglilinis ay masayang napangiti ang kaniyang ina habang tinitingnan ang maaliwalas nilang bahay."),
      StoryScene(image: assetPath("/story-5-scene-13.webp"), narration: "Salamat, anak. Napabilis mo ang mga gawain ko. Puwede ka na maglaro doon sa bahay nila Sofia. Wala lang iyon, mama. Dapat nga matagal ko itong ginagawa. Huwag kang mag-alala at lagi na kitang tutulungan dito sa bahay, ma."),
      StoryScene(image: assetPath("/story-5-scene-14.webp"), narration: "Dahil doon, hindi na lamang naglalaro si Anya pagkatapos ng klase."),
      StoryScene(image: assetPath("/story-5-scene-15.webp"), narration: "Sinisiguro muna niyang nakakatulong siya sa bahay at tapos na ang kaniyang mga gawain."),
      StoryScene(image: assetPath("/story-5-scene-16.webp"), narration: "Napagtanto niyang hindi na kailangan utusan bago tumulong."),
      StoryScene(image: assetPath("/story-5-scene-17.webp"), narration: "Sa paraang ito ay naipapakita niya ang kaniyang pagiging responsableng anak at pagmamahal sa pamilya."),
      StoryScene(image: assetPath("/story-5-scene-18.webp"), narration: "Matuto tayong tumulong sa bahay nang hindi na kailangang utusan. Ang pagtulong ay nagpapakita ng pagiging responsable at pagmamahal sa pamilya."),
      StoryScene(image: assetPath("/story-5-scene-19.webp"), narration: "Matuto tayong tumulong sa bahay nang hindi na kailangang utusan. Ang pagtulong ay nagpapakita ng pagiging responsable at pagmamahal sa pamilya."),
    ],
    quiz: anyaQuiz,
    finalCard: sharedFinalCard,
  ),
  Story(
    title: "Tara, Laro Tayo!",
    image: assetPath("/story-6.jpg"),
    cover: assetPath("/story-6-cover.webp"),
    scenes: <StoryScene>[
      StoryScene(image: assetPath("/story-6-scene-1.webp"), narration: "Magkaibigan na sina Dwayne at Clara mula noong sila ay maliliit pa. Si Dwayne ay palakaibigan at madaling makipag-usap sa iba. Si Clara naman ay mahiyain at tahimik."),
      StoryScene(image: assetPath("/story-6-scene-2.webp"), narration: "Isang araw, nagkaroon ng bagong grupo ng mga kaibigan si Dwayne. Sila sina Jasmine, Raine, Althea, at Mia."),
      StoryScene(image: assetPath("/story-6-scene-3.webp"), narration: "Mga kaibigan, gusto kong ipakilala sa inyo si Clara. Matagal na kaming magkaibigan dahil magkababata kami. Halika, sabay ka sa amin sa tanghalian. Hi, Clara!"),
      StoryScene(image: assetPath("/story-6-scene-4.webp"), narration: "Noong una ay nahihiya si Clara. Ngunit dahil mabait ang mga kaibigan ni Dwayne, unti-unti siyang naging komportable sa kanila."),
      StoryScene(image: assetPath("/story-6-scene-5.webp"), narration: "Mula noon, lagi na silang magkakasama. Sabay silang kumakain tuwing tanghalian, naglalaro sa palaruan, at nagtutulungan sa mga gawain sa klase."),
      StoryScene(image: assetPath("/story-6-scene-6.webp"), narration: "Isang hapon, naglalaro sila nang hindi sinasadyang matamaan ni Althea ang laruan ni Clara."),
      StoryScene(image: assetPath("/story-6-scene-7.webp"), narration: "Ay! Clara, sorry! Okay lang."),
      StoryScene(image: assetPath("/story-6-scene-8.webp"), narration: "Sigurado ka bang okay ka lang? Ngunit napansin ni Dwayne na tila malungkot si Clara."),
      StoryScene(image: assetPath("/story-6-scene-9.webp"), narration: "Tumahimik si Clara bago sumagot. Medyo nalungkot lang ako kasi akala ko sinadya niya."),
      StoryScene(image: assetPath("/story-6-scene-10.webp"), narration: "Agad na humingi ng paumanhin si Althea. Hindi ko talaga sinasadya, pasensya na. Sana sinabi mo agad sa akin."),
      StoryScene(image: assetPath("/story-6-scene-11.webp"), narration: "Okay na tayo."),
      StoryScene(image: assetPath("/story-6-scene-12.webp"), narration: "Pagkatapos noon, nagpatuloy silang maglaro. Natutunan nila na kapag may hindi pagkakaunawaan, mas mabuting pag-usapan ito kaysa magalit at umiwas sa isa't isa."),
      StoryScene(image: assetPath("/story-6-scene-13.webp"), narration: "Bago sila umuwi, napansin nilang malungkot si Jasmine."),
      StoryScene(image: assetPath("/story-6-scene-14.webp"), narration: "Ano ang problema, Jasmine? May sakit ang kapatid ko."),
      StoryScene(image: assetPath("/story-6-scene-15.webp"), narration: "Ipagdarasal namin siya, sabi ni Raine. Tumango ang lahat at sama-samang nanalangin para sa kapatid ni Jasmine."),
      StoryScene(image: assetPath("/story-6-scene-16.webp"), narration: "Kinabukasan, masaya silang nagkita muli."),
      StoryScene(image: assetPath("/story-6-scene-17.webp"), narration: "Mas mabuti na ang kalagayan ng kapatid ko! Naku, salamat! Nagpalakpakan ang magkakaibigan."),
      StoryScene(image: assetPath("/story-6-scene-18.webp"), narration: "Kapag may problema, hindi natin kailangang harapin ito nang mag-isa! Tama!"),
      StoryScene(image: assetPath("/story-6-scene-19.webp"), narration: "Ang tunay na pagkakaibigan ay may pag-unawa, suporta, malasakit, at pagtutulungan. Ang mabubuting kaibigan ay nandiyan sa masasaya at mahihirap na panahon."),
    ],
    quiz: taraQuiz,
    finalCard: sharedFinalCard,
  ),
];

