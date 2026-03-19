#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-type}"

emoji="$(sed '1,/^### DATA ###$/d' "$0" | fuzzel --match-mode fzf --dmenu | cut -d ' ' -f 1 | tr -d '\n')"

case "$MODE" in
    type)
        wtype "${emoji}" || wl-copy "${emoji}"
        ;;
    copy)
        wl-copy "${emoji}"
        ;;
    both)
        wtype "${emoji}" || true
        wl-copy "${emoji}"
        ;;
    *)
        echo "Usage: $0 [type|copy|both]"
        exit 1
        ;;
esac

exit
### DATA ###
😀 grinning face face smile happy joy :D grin
😃 grinning face with big eyes face happy joy haha :D :) smile funny
😄 grinning face with smiling eyes face happy joy funny haha laugh like :D :) smile
😁 beaming face with smiling eyes face happy smile joy kawaii
🫩 Face with Bags Under Eyes
😆 grinning squinting face happy joy lol satisfied haha face glad XD laugh
😅 grinning face with sweat face hot happy laugh sweat smile relief
🤣 rolling on the floor laughing face rolling floor laughing lol haha rofl
😂 face with tears of joy face cry tears weep happy happytears haha
🙂 slightly smiling face face smile
🙃 upside down face face flipped silly smile
😉 winking face face happy mischievous secret ;) smile eye
😊 smiling face with smiling eyes face smile happy flushed crush embarrassed shy joy
😇 smiling face with halo face angel heaven halo
🥰 smiling face with hearts face love like affection valentines infatuation crush hearts adore
😍 smiling face with heart eyes face love like affection valentines infatuation crush heart
🤩 star struck face smile starry eyes grinning
😘 face blowing a kiss face love like affection valentines infatuation kiss
😗 kissing face love like face 3 valentines infatuation kiss
☺️ smiling face face blush massage happiness
😚 kissing face with closed eyes face love like affection valentines infatuation kiss
😙 kissing face with smiling eyes face affection valentines infatuation kiss
😋 face savoring food happy joy tongue smile face silly yummy nom delicious savouring
😛 face with tongue face prank childish playful mischievous smile tongue
😜 winking face with tongue face prank childish playful mischievous smile wink tongue
🤪 zany face face goofy crazy
😝 squinting face with tongue face prank playful mischievous smile tongue
🤑 money mouth face face rich dollar money
🤗 hugging face face smile hug
🤭 face with hand over mouth face whoops shock surprise
🤫 shushing face face quiet shhh
🤔 thinking face face hmmm think consider
🤐 zipper mouth face face sealed zipper secret
🤨 face with raised eyebrow face distrust scepticism disapproval disbelief surprise
😐 neutral face indifference meh :| neutral
😑 expressionless face face indifferent - - meh deadpan
😶 face without mouth face hellokitty
😏 smirking face face smile mean prank smug sarcasm
😒 unamused face indifference bored straight face serious sarcasm unimpressed skeptical dubious side eye
🙄 face with rolling eyes face eyeroll frustrated
😬 grimacing face face grimace teeth
🤥 lying face face lie pinocchio
😌 relieved face face relaxed phew massage happiness
😔 pensive face face sad depressed upset
😪 sleepy face face tired rest nap
🤤 drooling face face
😴 sleeping face face tired sleepy night zzz
😷 face with medical mask face sick ill disease
🤒 face with thermometer sick temperature thermometer cold fever
🤕 face with head bandage injured clumsy bandage hurt
🤢 nauseated face face vomit gross green sick throw up ill
🤮 face vomiting face sick
🤧 sneezing face face gesundheit sneeze sick allergy
🥵 hot face face feverish heat red sweating
🥶 cold face face blue freezing frozen frostbite icicles
🥴 woozy face face dizzy intoxicated tipsy wavy
😵 dizzy face spent unconscious xox dizzy
🤯 exploding head face shocked mind blown
🤠 cowboy hat face face cowgirl hat
🥳 partying face face celebration woohoo
😎 smiling face with sunglasses face cool smile summer beach sunglass
🤓 nerd face face nerdy geek dork
🧐 face with monocle face stuffy wealthy
😕 confused face face indifference huh weird hmmm :/
😟 worried face face concern nervous :(
🙁 slightly frowning face face frowning disappointed sad upset
☹️ frowning face face sad upset frown
😮 face with open mouth face surprise impressed wow whoa :O
😯 hushed face face woo shh
😲 astonished face face xox surprised poisoned
😳 flushed face face blush shy flattered sex
🥺 pleading face face begging mercy
😦 frowning face with open mouth face aw what
😧 anguished face face stunned nervous
😨 fearful face face scared terrified nervous oops huh
😰 anxious face with sweat face nervous sweat
😥 sad but relieved face face phew sweat nervous
😢 crying face face tears sad depressed upset :'(
😭 loudly crying face face cry tears sad upset depressed sob
😱 face screaming in fear face munch scared omg
😖 confounded face face confused sick unwell oops :S
😣 persevering face face sick no upset oops
😞 disappointed face face sad upset depressed :(
😓 downcast face with sweat face hot sad tired exercise
😩 weary face face tired sleepy sad frustrated upset
😫 tired face sick whine upset frustrated
🥱 yawning face tired sleepy
😤 face with steam from nose face gas phew proud pride
😡 pouting face angry mad hate despise
😠 angry face mad face annoyed frustrated
🤬 face with symbols on mouth face swearing cursing cussing profanity expletive
😈 smiling face with horns devil horns
👿 angry face with horns devil angry horns
💀 skull dead skeleton creepy death
☠️ skull and crossbones poison danger deadly scary death pirate evil
💩 pile of poo hankey shitface fail turd shit
🤡 clown face face
👹 ogre monster red mask halloween scary creepy devil demon japanese ogre
👺 goblin red evil mask monster scary creepy japanese goblin
👻 ghost halloween spooky scary
👽 alien UFO paul weird outer space
👾 alien monster game arcade play
🤖 robot computer machine bot
😺 grinning cat animal cats happy smile
😸 grinning cat with smiling eyes animal cats smile
😹 cat with tears of joy animal cats haha happy tears
😻 smiling cat with heart eyes animal love like affection cats valentines heart
😼 cat with wry smile animal cats smirk
😽 kissing cat animal cats kiss
🙀 weary cat animal cats munch scared scream
😿 crying cat animal tears weep sad cats upset cry
😾 pouting cat animal cats
🙈 see no evil monkey monkey animal nature haha
🙉 hear no evil monkey animal monkey nature
🙊 speak no evil monkey monkey animal nature omg
💋 kiss mark face lips love like affection valentines
💌 love letter email like affection envelope valentines
💘 heart with arrow love like heart affection valentines
💝 heart with ribbon love valentines
💖 sparkling heart love like affection valentines
💗 growing heart like love affection valentines pink
💓 beating heart love like affection valentines pink heart
💞 revolving hearts love like affection valentines
💕 two hearts love like affection valentines heart
💟 heart decoration purple-square love like
❣️ heart exclamation decoration love
💔 broken heart sad sorry break heart heartbreak
❤️ red heart love like valentines
🧡 orange heart love like affection valentines
💛 yellow heart love like affection valentines
💚 green heart love like affection valentines
💙 blue heart love like affection valentines
💜 purple heart love like affection valentines
🤎 brown heart coffee
🖤 black heart evil
🤍 white heart pure
💯 hundred points score perfect numbers century exam quiz test pass hundred
💢 anger symbol angry mad
💥 collision bomb explode explosion collision blown
💫 dizzy star sparkle shoot magic
💦 sweat droplets water drip oops
💨 dashing away wind air fast shoo fart smoke puff
🕳️ hole embarrassing
💣 bomb boom explode explosion terrorism
💬 speech balloon bubble words message talk chatting
👁️‍🗨️ eye in speech bubble info
🗨️ left speech bubble words message talk chatting
🗯️ right anger bubble caption speech thinking mad
💭 thought balloon bubble cloud speech thinking dream
💤 zzz sleepy tired dream
👋 waving hand hands gesture goodbye solong farewell hello hi palm
🤚 raised back of hand fingers raised backhand
🖐️ hand with fingers splayed hand fingers palm
✋ raised hand fingers stop highfive palm ban
🖖 vulcan salute hand fingers spock star trek
👌 ok hand fingers limbs perfect ok okay
🤏 pinching hand tiny small size
✌️ victory hand fingers ohyeah hand peace victory two
🤞 crossed fingers good lucky
🤟 love you gesture hand fingers gesture
🤘 sign of the horns hand fingers evil eye sign of horns rock on
🤙 call me hand hands gesture shaka
👈 backhand index pointing left direction fingers hand left
👉 backhand index pointing right fingers hand direction right
👆 backhand index pointing up fingers hand direction up
🖕 middle finger hand fingers rude middle flipping
👇 backhand index pointing down fingers hand direction down
☝️ index pointing up hand fingers direction up
👍 thumbs up thumbsup yes awesome good agree accept cool hand like +1
👎 thumbs down thumbsdown no dislike hand -1
🫆 Fingerprint
✊ raised fist fingers hand grasp
👊 oncoming fist angry violence fist hit attack hand
🤛 left facing fist hand fistbump
🤜 right facing fist hand fistbump
👏 clapping hands hands praise applause congrats yay
🙌 raising hands gesture hooray yea celebration hands
👐 open hands fingers butterfly hands open
🤲 palms up together hands gesture cupped prayer
🤝 handshake agreement shake
🙏 folded hands please hope wish namaste highfive pray thanks
✍️ writing hand lower left ballpoint pen stationery write compose
💅 nail polish beauty manicure finger fashion nail
🤳 selfie camera phone
💪 flexed biceps arm flex hand summer strong biceps
🦾 mechanical arm accessibility
🦿 mechanical leg accessibility
🦵 leg kick limb
🦶 foot kick stomp
👂 ear face hear sound listen
🦻 ear with hearing aid accessibility
👃 nose smell sniff
🧠 brain smart intelligent
🦷 tooth teeth dentist
🦴 bone skeleton
👀 eyes look watch stalk peek see
👁️ eye face look see watch stare
👅 tongue mouth playful
👄 mouth mouth kiss
👶 baby child boy girl toddler
🧒 child gender-neutral young
👦 boy man male guy teenager
👧 girl female woman teenager
🧑 person gender-neutral person
👱 person blond hair hairstyle
👨 man mustache father dad guy classy sir moustache
🧔 man beard person bewhiskered
👨‍🦰 man red hair hairstyle
👨‍🦱 man curly hair hairstyle
👨‍🦳 man white hair old elder
👨‍🦲 man bald hairless
👩 woman female girls lady
👩‍🦰 woman red hair hairstyle
🧑‍🦰 person red hair hairstyle
👩‍🦱 woman curly hair hairstyle
🧑‍🦱 person curly hair hairstyle
👩‍🦳 woman white hair old elder
🧑‍🦳 person white hair elder old
👩‍🦲 woman bald hairless
🧑‍🦲 person bald hairless
👱‍♀️ woman blond hair woman female girl blonde person
👱‍♂️ man blond hair man male boy blonde guy person
🧓 older person human elder senior gender-neutral
👴 old man human male men old elder senior
👵 old woman human female women lady old elder senior
🙍 person frowning worried
🙍‍♂️ man frowning male boy man sad depressed discouraged unhappy
🙍‍♀️ woman frowning female girl woman sad depressed discouraged unhappy
🙎 person pouting upset
🙎‍♂️ man pouting male boy man
🙎‍♀️ woman pouting female girl woman
🙅 person gesturing no decline
🙅‍♂️ man gesturing no male boy man nope
🙅‍♀️ woman gesturing no female girl woman nope
🙆 person gesturing ok agree
🙆‍♂️ man gesturing ok men boy male blue human man
🙆‍♀️ woman gesturing ok women girl female pink human woman
💁 person tipping hand information
💁‍♂️ man tipping hand male boy man human information
💁‍♀️ woman tipping hand female girl woman human information
🙋 person raising hand question
🙋‍♂️ man raising hand male boy man
🙋‍♀️ woman raising hand female girl woman
🧏 deaf person accessibility
🧏‍♂️ deaf man accessibility
🧏‍♀️ deaf woman accessibility
🙇 person bowing respectiful
🙇‍♂️ man bowing man male boy
🙇‍♀️ woman bowing woman female girl
🤦 person facepalming disappointed
🤦‍♂️ man facepalming man male boy disbelief
🤦‍♀️ woman facepalming woman female girl disbelief
🤷 person shrugging regardless
🤷‍♂️ man shrugging man male boy confused indifferent doubt
🤷‍♀️ woman shrugging woman female girl confused indifferent doubt
🧑‍⚕️ health worker hospital
👨‍⚕️ man health worker doctor nurse therapist healthcare man human
👩‍⚕️ woman health worker doctor nurse therapist healthcare woman human
🧑‍🎓 student learn
👨‍🎓 man student graduate man human
👩‍🎓 woman student graduate woman human
🧑‍🏫 teacher professor
👨‍🏫 man teacher instructor professor man human
👩‍🏫 woman teacher instructor professor woman human
🧑‍⚖️ judge law
👨‍⚖️ man judge justice court man human
👩‍⚖️ woman judge justice court woman human
🧑‍🌾 farmer crops
👨‍🌾 man farmer rancher gardener man human
👩‍🌾 woman farmer rancher gardener woman human
🧑‍🍳 cook food kitchen culinary
👨‍🍳 man cook chef man human
👩‍🍳 woman cook chef woman human
🧑‍🔧 mechanic worker technician
👨‍🔧 man mechanic plumber man human wrench
👩‍🔧 woman mechanic plumber woman human wrench
🧑‍🏭 factory worker labor
👨‍🏭 man factory worker assembly industrial man human
👩‍🏭 woman factory worker assembly industrial woman human
🧑‍💼 office worker business
👨‍💼 man office worker business manager man human
👩‍💼 woman office worker business manager woman human
🧑‍🔬 scientist chemistry
👨‍🔬 man scientist biologist chemist engineer physicist man human
👩‍🔬 woman scientist biologist chemist engineer physicist woman human
🧑‍💻 technologist computer
👨‍💻 man technologist coder developer engineer programmer software man human laptop computer
👩‍💻 woman technologist coder developer engineer programmer software woman human laptop computer
🧑‍🎤 singer song artist performer
👨‍🎤 man singer rockstar entertainer man human
👩‍🎤 woman singer rockstar entertainer woman human
🧑‍🎨 artist painting draw creativity
👨‍🎨 man artist painter man human
👩‍🎨 woman artist painter woman human
🧑‍✈️ pilot fly plane airplane
👨‍✈️ man pilot aviator plane man human
👩‍✈️ woman pilot aviator plane woman human
🧑‍🚀 astronaut outerspace
👨‍🚀 man astronaut space rocket man human
👩‍🚀 woman astronaut space rocket woman human
🧑‍🚒 firefighter fire
👨‍🚒 man firefighter fireman man human
👩‍🚒 woman firefighter fireman woman human
👮 police officer cop
👮‍♂️ man police officer man police law legal enforcement arrest 911
👮‍♀️ woman police officer woman police law legal enforcement arrest 911 female
🕵️ detective human spy detective
🕵️‍♂️ man detective crime
🕵️‍♀️ woman detective human spy detective female woman
💂 guard protect
💂‍♂️ man guard uk gb british male guy royal
💂‍♀️ woman guard uk gb british female royal woman
👷 construction worker labor build
👷‍♂️ man construction worker male human wip guy build construction worker labor
👷‍♀️ woman construction worker female human wip build construction worker labor woman
🤴 prince boy man male crown royal king
👸 princess girl woman female blond crown royal queen
👳 person wearing turban headdress
👳‍♂️ man wearing turban male indian hinduism arabs
👳‍♀️ woman wearing turban female indian hinduism arabs woman
👲 man with skullcap male boy chinese
🧕 woman with headscarf female hijab mantilla tichel
🤵 man in tuxedo couple marriage wedding groom
👰 bride with veil couple marriage wedding woman bride
🤰 pregnant woman baby
🤱 breast feeding nursing baby
👼 baby angel heaven wings halo
🎅 santa claus festival man male xmas father christmas
🤶 mrs claus woman female xmas mother christmas
🦸 superhero marvel
🦸‍♂️ man superhero man male good hero superpowers
🦸‍♀️ woman superhero woman female good heroine superpowers
🦹 supervillain marvel
🦹‍♂️ man supervillain man male evil bad criminal hero superpowers
🦹‍♀️ woman supervillain woman female evil bad criminal heroine superpowers
🧙 mage magic
🧙‍♂️ man mage man male mage sorcerer
🧙‍♀️ woman mage woman female mage witch
🧚 fairy wings magical
🧚‍♂️ man fairy man male
🧚‍♀️ woman fairy woman female
🧛 vampire blood twilight
🧛‍♂️ man vampire man male dracula
🧛‍♀️ woman vampire woman female
🧜 merperson sea
🧜‍♂️ merman man male triton
🧜‍♀️ mermaid woman female merwoman ariel
🧝 elf magical
🧝‍♂️ man elf man male
🧝‍♀️ woman elf woman female
🧞 genie magical wishes
🧞‍♂️ man genie man male
🧞‍♀️ woman genie woman female
🧟 zombie dead
🧟‍♂️ man zombie man male dracula undead walking dead
🧟‍♀️ woman zombie woman female undead walking dead
💆 person getting massage relax
💆‍♂️ man getting massage male boy man head
💆‍♀️ woman getting massage female girl woman head
💇 person getting haircut hairstyle
💇‍♂️ man getting haircut male boy man
💇‍♀️ woman getting haircut female girl woman
🚶 person walking move
🚶‍♂️ man walking human feet steps
🚶‍♀️ woman walking human feet steps woman female
🧍 person standing still
🧍‍♂️ man standing still
🧍‍♀️ woman standing still
🧎 person kneeling pray respectful
🧎‍♂️ man kneeling pray respectful
🧎‍♀️ woman kneeling respectful pray
🧑‍🦯 person with probing cane blind
👨‍🦯 man with probing cane blind
👩‍🦯 woman with probing cane blind
🧑‍🦼 person in motorized wheelchair disability accessibility
👨‍🦼 man in motorized wheelchair disability accessibility
👩‍🦼 woman in motorized wheelchair disability accessibility
🧑‍🦽 person in manual wheelchair disability accessibility
👨‍🦽 man in manual wheelchair disability accessibility
👩‍🦽 woman in manual wheelchair disability accessibility
🏃 person running move
🏃‍♂️ man running man walking exercise race running
🏃‍♀️ woman running woman walking exercise race running female
💃 woman dancing female girl woman fun
🕺 man dancing male boy fun dancer
🕴️ man in suit levitating suit business levitate hover jump
👯 people with bunny ears perform costume
👯‍♂️ men with bunny ears male bunny men boys
👯‍♀️ women with bunny ears female bunny women girls
🧖 person in steamy room relax spa
🧖‍♂️ man in steamy room male man spa steamroom sauna
🧖‍♀️ woman in steamy room female woman spa steamroom sauna
🧗 person climbing sport
🧗‍♂️ man climbing sports hobby man male rock
🧗‍♀️ woman climbing sports hobby woman female rock
🤺 person fencing sports fencing sword
🏇 horse racing animal betting competition gambling luck
⛷️ skier sports winter snow
🏂 snowboarder sports winter
🏌️ person golfing sports business
🏌️‍♂️ man golfing sport
🏌️‍♀️ woman golfing sports business woman female
🏄 person surfing sport sea
🏄‍♂️ man surfing sports ocean sea summer beach
🏄‍♀️ woman surfing sports ocean sea summer beach woman female
🚣 person rowing boat sport move
🚣‍♂️ man rowing boat sports hobby water ship
🚣‍♀️ woman rowing boat sports hobby water ship woman female
🏊 person swimming sport pool
🏊‍♂️ man swimming sports exercise human athlete water summer
🏊‍♀️ woman swimming sports exercise human athlete water summer woman female
⛹️ person bouncing ball sports human
⛹️‍♂️ man bouncing ball sport
⛹️‍♀️ woman bouncing ball sports human woman female
🏋️ person lifting weights sports training exercise
🏋️‍♂️ man lifting weights sport
🏋️‍♀️ woman lifting weights sports training exercise woman female
🚴 person biking sport move
🚴‍♂️ man biking sports bike exercise hipster
🚴‍♀️ woman biking sports bike exercise hipster woman female
🚵 person mountain biking sport move
🚵‍♂️ man mountain biking transportation sports human race bike
🚵‍♀️ woman mountain biking transportation sports human race bike woman female
🤸 person cartwheeling sport gymnastic
🤸‍♂️ man cartwheeling gymnastics
🤸‍♀️ woman cartwheeling gymnastics
🤼 people wrestling sport
🤼‍♂️ men wrestling sports wrestlers
🤼‍♀️ women wrestling sports wrestlers
🤽 person playing water polo sport
🤽‍♂️ man playing water polo sports pool
🤽‍♀️ woman playing water polo sports pool
🤾 person playing handball sport
🤾‍♂️ man playing handball sports
🤾‍♀️ woman playing handball sports
🤹 person juggling performance balance
🤹‍♂️ man juggling juggle balance skill multitask
🤹‍♀️ woman juggling juggle balance skill multitask
🧘 person in lotus position meditate
🧘‍♂️ man in lotus position man male meditation yoga serenity zen mindfulness
🧘‍♀️ woman in lotus position woman female meditation yoga serenity zen mindfulness
🛀 person taking bath clean shower bathroom
🛌 person in bed bed rest
🧑‍🤝‍🧑 people holding hands friendship
👭 women holding hands pair friendship couple love like female people human
👫 woman and man holding hands pair people human love date dating like affection valentines marriage
👬 men holding hands pair couple love like bromance friendship people human
💏 kiss pair valentines love like dating marriage
👩‍❤️‍💋‍👨 kiss woman man love
👨‍❤️‍💋‍👨 kiss man man pair valentines love like dating marriage
👩‍❤️‍💋‍👩 kiss woman woman pair valentines love like dating marriage
💑 couple with heart pair love like affection human dating valentines marriage
👩‍❤️‍👨 couple with heart woman man love
👨‍❤️‍👨 couple with heart man man pair love like affection human dating valentines marriage
👩‍❤️‍👩 couple with heart woman woman pair love like affection human dating valentines marriage
👪 family home parents child mom dad father mother people human
👨‍👩‍👦 family man woman boy love
👨‍👩‍👧 family man woman girl home parents people human child
👨‍👩‍👧‍👦 family man woman girl boy home parents people human children
👨‍👩‍👦‍👦 family man woman boy boy home parents people human children
👨‍👩‍👧‍👧 family man woman girl girl home parents people human children
👨‍👨‍👦 family man man boy home parents people human children
👨‍👨‍👧 family man man girl home parents people human children
👨‍👨‍👧‍👦 family man man girl boy home parents people human children
👨‍👨‍👦‍👦 family man man boy boy home parents people human children
👨‍👨‍👧‍👧 family man man girl girl home parents people human children
👩‍👩‍👦 family woman woman boy home parents people human children
👩‍👩‍👧 family woman woman girl home parents people human children
👩‍👩‍👧‍👦 family woman woman girl boy home parents people human children
👩‍👩‍👦‍👦 family woman woman boy boy home parents people human children
👩‍👩‍👧‍👧 family woman woman girl girl home parents people human children
👨‍👦 family man boy home parent people human child
👨‍👦‍👦 family man boy boy home parent people human children
👨‍👧 family man girl home parent people human child
👨‍👧‍👦 family man girl boy home parent people human children
👨‍👧‍👧 family man girl girl home parent people human children
👩‍👦 family woman boy home parent people human child
👩‍👦‍👦 family woman boy boy home parent people human children
👩‍👧 family woman girl home parent people human child
👩‍👧‍👦 family woman girl boy home parent people human children
👩‍👧‍👧 family woman girl girl home parent people human children
🗣️ speaking head user person human sing say talk
👤 bust in silhouette user person human
👥 busts in silhouette user person human group team
👣 footprints feet tracking walking beach
🐵 monkey face animal nature circus
🐒 monkey animal nature banana circus
🦍 gorilla animal nature circus
🦧 orangutan animal
🐶 dog face animal friend nature woof puppy pet faithful
🐕 dog animal nature friend doge pet faithful
🦮 guide dog animal blind
🐕‍🦺 service dog blind animal
🐩 poodle dog animal 101 nature pet
🐺 wolf animal nature wild
🦊 fox animal nature face
🦝 raccoon animal nature
🐱 cat face animal meow nature pet kitten
🐈 cat animal meow pet cats
🦁 lion animal nature
🐯 tiger face animal cat danger wild nature roar
🐅 tiger animal nature roar
🐆 leopard animal nature
🐴 horse face animal brown nature
🐎 horse animal gamble luck
🦄 unicorn animal nature mystical
🦓 zebra animal nature stripes safari
🦌 deer animal nature horns venison
🐮 cow face beef ox animal nature moo milk
🐂 ox animal cow beef
🐃 water buffalo animal nature ox cow
🐄 cow beef ox animal nature moo milk
🐷 pig face animal oink nature
🐖 pig animal nature
🐗 boar animal nature
🐽 pig nose animal oink
🐏 ram animal sheep nature
🐑 ewe animal nature wool shipit
🐐 goat animal nature
🐪 camel animal hot desert hump
🐫 two hump camel animal nature hot desert hump
🦙 llama animal nature alpaca
🦒 giraffe animal nature spots safari
🐘 elephant animal nature nose th circus
🦏 rhinoceros animal nature horn
🦛 hippopotamus animal nature
🐭 mouse face animal nature cheese wedge rodent
🐁 mouse animal nature rodent
🐀 rat animal mouse rodent
🐹 hamster animal nature
🐰 rabbit face animal nature pet spring magic bunny
🐇 rabbit animal nature pet magic spring
🐿️ chipmunk animal nature rodent squirrel
🦔 hedgehog animal nature spiny
🦇 bat animal nature blind vampire
🐻 bear animal nature wild
🐨 koala animal nature
🐼 panda animal nature panda
🦥 sloth animal
🦦 otter animal
🦨 skunk animal
🦘 kangaroo animal nature australia joey hop marsupial
🦡 badger animal nature honey
🐾 paw prints animal tracking footprints dog cat pet feet
🦃 turkey animal bird
🐔 chicken animal cluck nature bird
🐓 rooster animal nature chicken
🐣 hatching chick animal chicken egg born baby bird
🐤 baby chick animal chicken bird
🐥 front facing baby chick animal chicken baby bird
🐦 bird animal nature fly tweet spring
🐧 penguin animal nature
🕊️ dove animal bird
🦅 eagle animal nature bird
🦆 duck animal nature bird mallard
🦢 swan animal nature bird
🦉 owl animal nature bird hoot
🦩 flamingo animal
🦚 peacock animal nature peahen bird
🦜 parrot animal nature bird pirate talk
🐸 frog animal nature croak toad
🐊 crocodile animal nature reptile lizard alligator
🐢 turtle animal slow nature tortoise
🦎 lizard animal nature reptile
🐍 snake animal evil nature hiss python
🐲 dragon face animal myth nature chinese green
🐉 dragon animal myth nature chinese green
🦕 sauropod animal nature dinosaur brachiosaurus brontosaurus diplodocus extinct
🦖 t rex animal nature dinosaur tyrannosaurus extinct
🐳 spouting whale animal nature sea ocean
🐋 whale animal nature sea ocean
🐬 dolphin animal nature fish sea ocean flipper fins beach
🐟 fish animal food nature
🐠 tropical fish animal swim ocean beach nemo
🐡 blowfish animal nature food sea ocean
🦈 shark animal nature fish sea ocean jaws fins beach
🐙 octopus animal creature ocean sea nature beach
🐚 spiral shell nature sea beach
🐌 snail slow animal shell
🦋 butterfly animal insect nature caterpillar
🐛 bug animal insect nature worm
🐜 ant animal insect nature bug
🐝 honeybee animal insect nature bug spring honey
🐞 lady beetle animal insect nature ladybug
🦗 cricket animal cricket chirp
🕷️ spider animal arachnid
🕸️ spider web animal insect arachnid silk
🦂 scorpion animal arachnid
🦟 mosquito animal nature insect malaria
🦠 microbe amoeba bacteria germs virus
💐 bouquet flowers nature spring
🌸 cherry blossom nature plant spring flower
💮 white flower japanese spring
🏵️ rosette flower decoration military
🌹 rose flowers valentines love spring
🥀 wilted flower plant nature flower
🌺 hibiscus plant vegetable flowers beach
🌻 sunflower nature plant fall
🌼 blossom nature flowers yellow
🌷 tulip flowers plant nature summer spring
🌱 seedling plant nature grass lawn spring
🌲 evergreen tree plant nature
🌳 deciduous tree plant nature
🌴 palm tree plant vegetable nature summer beach mojito tropical
🌵 cactus vegetable plant nature
🌾 sheaf of rice nature plant
🌿 herb vegetable plant medicine weed grass lawn
☘️ shamrock vegetable plant nature irish clover
🍀 four leaf clover vegetable plant nature lucky irish
🍁 maple leaf nature plant vegetable ca fall
🫜 root Vegetable
🍂 fallen leaf nature plant vegetable leaves
🪾 Leafless Tree
🍃 leaf fluttering in wind nature plant tree vegetable grass lawn spring
🍇 grapes fruit food wine
🍈 melon fruit nature food
🍉 watermelon fruit food picnic summer
🍊 tangerine food fruit nature orange
🍋 lemon fruit nature
🍌 banana fruit food monkey
🍍 pineapple fruit nature food
🥭 mango fruit food tropical
🍎 red apple fruit mac school
🍏 green apple fruit nature
🍐 pear fruit nature food
🍑 peach fruit nature food
🍒 cherries food fruit
🍓 strawberry fruit food nature
🥝 kiwi fruit fruit food
🍅 tomato fruit vegetable nature food
🥥 coconut fruit nature food palm
🥑 avocado fruit food
🍆 eggplant vegetable nature food aubergine
🥔 potato food tuber vegatable starch
🥕 carrot vegetable food orange
🌽 ear of corn food vegetable plant
🌶️ hot pepper food spicy chilli chili
🥒 cucumber fruit food pickle
🥬 leafy green food vegetable plant bok choy cabbage kale lettuce
🥦 broccoli fruit food vegetable
🧄 garlic food spice cook
🧅 onion cook food spice
🍄 mushroom plant vegetable
🥜 peanuts food nut
🌰 chestnut food squirrel
🍞 bread food wheat breakfast toast
🥐 croissant food bread french
🥖 baguette bread food bread french
🥨 pretzel food bread twisted
🥯 bagel food bread bakery schmear
🥞 pancakes food breakfast flapjacks hotcakes
🧇 waffle food breakfast
🧀 cheese wedge food chadder
🍖 meat on bone good food drumstick
🍗 poultry leg food meat drumstick bird chicken turkey
🥩 cut of meat food cow meat cut chop lambchop porkchop
🥓 bacon food breakfast pork pig meat
🍔 hamburger meat fast food beef cheeseburger mcdonalds burger king
🍟 french fries chips snack fast food
🍕 pizza food party
🌭 hot dog food frankfurter
🥪 sandwich food lunch bread
🌮 taco food mexican
🌯 burrito food mexican
🥙 stuffed flatbread food flatbread stuffed gyro
🧆 falafel food
🥚 egg food chicken breakfast
🍳 cooking food breakfast kitchen egg
🥘 shallow pan of food food cooking casserole paella
🍲 pot of food food meat soup
🥣 bowl with spoon food breakfast cereal oatmeal porridge
🥗 green salad food healthy lettuce
🍿 popcorn food movie theater films snack
🧈 butter food cook
🧂 salt condiment shaker
🥫 canned food food soup
🍱 bento box food japanese box
🍘 rice cracker food japanese
🍙 rice ball food japanese
🍚 cooked rice food china asian
🍛 curry rice food spicy hot indian
🍜 steaming bowl food japanese noodle chopsticks
🍝 spaghetti food italian noodle
🍠 roasted sweet potato food nature
🍢 oden food japanese
🍣 sushi food fish japanese rice
🍤 fried shrimp food animal appetizer summer
🍥 fish cake with swirl food japan sea beach narutomaki pink swirl kamaboko surimi ramen
🥮 moon cake food autumn
🍡 dango food dessert sweet japanese barbecue meat
🥟 dumpling food empanada pierogi potsticker
🥠 fortune cookie food prophecy
🥡 takeout box food leftovers
🦀 crab animal crustacean
🦞 lobster animal nature bisque claws seafood
🦐 shrimp animal ocean nature seafood
🦑 squid animal nature ocean sea
🦪 oyster food
🍦 soft ice cream food hot dessert summer
🍧 shaved ice hot dessert summer
🍨 ice cream food hot dessert
🍩 doughnut food dessert snack sweet donut
🍪 cookie food snack oreo chocolate sweet dessert
🎂 birthday cake food dessert cake
🍰 shortcake food dessert
🧁 cupcake food dessert bakery sweet
🥧 pie food dessert pastry
🍫 chocolate bar food snack dessert sweet
🍬 candy snack dessert sweet lolly
🍭 lollipop food snack candy sweet
🍮 custard dessert food
🍯 honey pot bees sweet kitchen
🍼 baby bottle food container milk
🥛 glass of milk beverage drink cow
☕ hot beverage beverage caffeine latte espresso coffee
🍵 teacup without handle drink bowl breakfast green british
🍶 sake wine drink drunk beverage japanese alcohol booze
🍾 bottle with popping cork drink wine bottle celebration
🍷 wine glass drink beverage drunk alcohol booze
🍸 cocktail glass drink drunk alcohol beverage booze mojito
🍹 tropical drink beverage cocktail summer beach alcohol booze mojito
🍺 beer mug relax beverage drink drunk party pub summer alcohol booze
🍻 clinking beer mugs relax beverage drink drunk party pub summer alcohol booze
🥂 clinking glasses beverage drink party alcohol celebrate cheers wine champagne toast
🥃 tumbler glass drink beverage drunk alcohol liquor booze bourbon scotch whisky glass shot
🥤 cup with straw drink soda
🧃 beverage box drink
🧉 mate drink tea beverage
🧊 ice water cold
🥢 chopsticks food
🍽️ fork and knife with plate food eat meal lunch dinner restaurant
🍴 fork and knife cutlery kitchen
🥄 spoon cutlery kitchen tableware
🔪 kitchen knife knife blade cutlery kitchen weapon
🏺 amphora vase jar
🌍 globe showing europe africa globe world international
🌎 globe showing americas globe world USA international
🌏 globe showing asia australia globe world east international
🌐 globe with meridians earth international world internet interweb i18n
🗺️ world map location direction
🗾 map of japan nation country japanese asia
🧭 compass magnetic navigation orienteering
🏔️ snow capped mountain photo nature environment winter cold
⛰️ mountain photo nature environment
🌋 volcano photo nature disaster
🗻 mount fuji photo mountain nature japanese
🏕️ camping photo outdoors tent
🏖️ beach with umbrella weather summer sunny sand mojito
🏜️ desert photo warm saharah
🏝️ desert island photo tropical mojito
🏞️ national park photo environment nature
🏟️ stadium photo place sports concert venue
🏛️ classical building art culture history
🏗️ building construction wip working progress
🧱 brick bricks
🏘️ houses buildings photo
🏚️ derelict house abandon evict broken building
🏠 house building home
🏡 house with garden home plant nature
🏢 office building building bureau work
🏣 japanese post office building envelope communication
🏤 post office building email
🏥 hospital building health surgery doctor
🏦 bank building money sales cash business enterprise
🏨 hotel building accomodation checkin
🏩 love hotel like affection dating
🏪 convenience store building shopping groceries
🏫 school building student education learn teach
🏬 department store building shopping mall
🏭 factory building industry pollution smoke
🏯 japanese castle photo building
🏰 castle building royalty history
💒 wedding love like affection couple marriage bride groom
🗼 tokyo tower photo japanese
🗽 statue of liberty american newyork
⛪ church building religion christ
🕌 mosque islam worship minaret
🛕 hindu temple religion
🕍 synagogue judaism worship temple jewish
⛩️ shinto shrine temple japan kyoto
🕋 kaaba mecca mosque islam
⛲ fountain photo summer water fresh
⛺ tent photo camping outdoors
🌁 foggy photo mountain
🌃 night with stars evening city downtown
🏙️ cityscape photo night life urban
🌄 sunrise over mountains view vacation photo
🌅 sunrise morning view vacation photo
🌆 cityscape at dusk photo evening sky buildings
🌇 sunset photo good morning dawn
🌉 bridge at night photo sanfrancisco
♨️ hot springs bath warm relax
🎠 carousel horse photo carnival
🎡 ferris wheel photo carnival londoneye
🎢 roller coaster carnival playground photo fun
💈 barber pole hair salon style
🎪 circus tent festival carnival party
🚂 locomotive transportation vehicle train
🚃 railway car transportation vehicle
🚄 high speed train transportation vehicle
🚅 bullet train transportation vehicle speed fast public travel
🚆 train transportation vehicle
🚇 metro transportation blue-square mrt underground tube
🚈 light rail transportation vehicle
🚉 station transportation vehicle public
🚊 tram transportation vehicle
🚝 monorail transportation vehicle
🚞 mountain railway transportation vehicle
🚋 tram car transportation vehicle carriage public travel
🚌 bus car vehicle transportation
🚍 oncoming bus vehicle transportation
🚎 trolleybus bart transportation vehicle
🚐 minibus vehicle car transportation
🚑 ambulance health 911 hospital
🚒 fire engine transportation cars vehicle
🚓 police car vehicle cars transportation law legal enforcement
🚔 oncoming police car vehicle law legal enforcement 911
🚕 taxi uber vehicle cars transportation
🚖 oncoming taxi vehicle cars uber
🚗 automobile red transportation vehicle
🚘 oncoming automobile car vehicle transportation
🚙 sport utility vehicle transportation vehicle
🚚 delivery truck cars transportation
🚛 articulated lorry vehicle cars transportation express
🚜 tractor vehicle car farming agriculture
🏎️ racing car sports race fast formula f1
🏍️ motorcycle race sports fast
🛵 motor scooter vehicle vespa sasha
🦽 manual wheelchair accessibility
🦼 motorized wheelchair accessibility
🛺 auto rickshaw move transportation
🚲 bicycle sports bicycle exercise hipster
🛴 kick scooter vehicle kick razor
🛹 skateboard board
🚏 bus stop transportation wait
🛣️ motorway road cupertino interstate highway
🛤️ railway track train transportation
🛢️ oil drum barrell
⛽ fuel pump gas station petroleum
🚨 police car light police ambulance 911 emergency alert error pinged law legal
🚥 horizontal traffic light transportation signal
🚦 vertical traffic light transportation driving
🛑 stop sign stop
🚧 construction wip progress caution warning
⚓ anchor ship ferry sea boat
⛵ sailboat ship summer transportation water sailing
🛶 canoe boat paddle water ship
🚤 speedboat ship transportation vehicle summer
🛳️ passenger ship yacht cruise ferry
⛴️ ferry boat ship yacht
🛥️ motor boat ship
🚢 ship transportation titanic deploy
✈️ airplane vehicle transportation flight fly
🛩️ small airplane flight transportation fly vehicle
🛫 airplane departure airport flight landing
🛬 airplane arrival airport flight boarding
🪂 parachute fly glide
💺 seat sit airplane transport bus flight fly
🚁 helicopter transportation vehicle fly
🚟 suspension railway vehicle transportation
🚠 mountain cableway transportation vehicle ski
🚡 aerial tramway transportation vehicle ski
🛰️ satellite communication gps orbit spaceflight NASA ISS
🚀 rocket launch ship staffmode NASA outer space outer space fly
🛸 flying saucer transportation vehicle ufo
🛎️ bellhop bell service
🧳 luggage packing travel
⌛ hourglass done time clock oldschool limit exam quiz test
⏳ hourglass not done oldschool time countdown
⌚ watch time accessories
⏰ alarm clock time wake
⏱️ stopwatch time deadline
⏲️ timer clock alarm
🕰️ mantelpiece clock time
🕛 twelve o clock time noon midnight midday late early schedule
🕧 twelve thirty time late early schedule
🕐 one o clock time late early schedule
🕜 one thirty time late early schedule
🕑 two o clock time late early schedule
🕝 two thirty time late early schedule
🕒 three o clock time late early schedule
🕞 three thirty time late early schedule
🕓 four o clock time late early schedule
🕟 four thirty time late early schedule
🕔 five o clock time late early schedule
🕠 five thirty time late early schedule
🕕 six o clock time late early schedule dawn dusk
🕡 six thirty time late early schedule
🕖 seven o clock time late early schedule
🕢 seven thirty time late early schedule
🕗 eight o clock time late early schedule
🕣 eight thirty time late early schedule
🕘 nine o clock time late early schedule
🕤 nine thirty time late early schedule
🕙 ten o clock time late early schedule
🕥 ten thirty time late early schedule
🕚 eleven o clock time late early schedule
🕦 eleven thirty time late early schedule
🌑 new moon nature twilight planet space night evening sleep
🌒 waxing crescent moon nature twilight planet space night evening sleep
🌓 first quarter moon nature twilight planet space night evening sleep
🌔 waxing gibbous moon nature night sky gray twilight planet space evening sleep
🌕 full moon nature yellow twilight planet space night evening sleep
🌖 waning gibbous moon nature twilight planet space night evening sleep waxing gibbous moon
🌗 last quarter moon nature twilight planet space night evening sleep
🌘 waning crescent moon nature twilight planet space night evening sleep
🌙 crescent moon night sleep sky evening magic
🌚 new moon face nature twilight planet space night evening sleep
🌛 first quarter moon face nature twilight planet space night evening sleep
🌜 last quarter moon face nature twilight planet space night evening sleep
🌡️ thermometer weather temperature hot cold
☀️ sun weather nature brightness summer beach spring
🌝 full moon face nature twilight planet space night evening sleep
🌞 sun with face nature morning sky
🪐 ringed planet outerspace
⭐ star night yellow
🌟 glowing star night sparkle awesome good magic
🌠 shooting star night photo
🌌 milky way photo space stars
☁️ cloud weather sky
⛅ sun behind cloud weather nature cloudy morning fall spring
⛈️ cloud with lightning and rain weather lightning
🌤️ sun behind small cloud weather
🌥️ sun behind large cloud weather
🌦️ sun behind rain cloud weather
🌧️ cloud with rain weather
🌨️ cloud with snow weather
🌩️ cloud with lightning weather thunder
🌪️ tornado weather cyclone twister
🌫️ fog weather
🌬️ wind face gust air
🌀 cyclone weather swirl blue cloud vortex spiral whirlpool spin tornado hurricane typhoon
🌈 rainbow nature happy unicorn face photo sky spring
🌂 closed umbrella weather rain drizzle
☂️ umbrella weather spring
☔ umbrella with rain drops rainy weather spring
⛱️ umbrella on ground weather summer
⚡ high voltage thunder weather lightning bolt fast
❄️ snowflake winter season cold weather christmas xmas
☃️ snowman winter season cold weather christmas xmas frozen
⛄ snowman without snow winter season cold weather christmas xmas frozen without snow
☄️ comet space
🔥 fire hot cook flame
💧 droplet water drip faucet spring
🌊 water wave sea water wave nature tsunami disaster
🎃 jack o lantern halloween light pumpkin creepy fall
🎄 christmas tree festival vacation december xmas celebration
🎆 fireworks photo festival carnival congratulations
🎇 sparkler stars night shine
🧨 firecracker dynamite boom explode explosion explosive
✨ sparkles stars shine shiny cool awesome good magic
🎈 balloon party celebration birthday circus
🎉 party popper party congratulations birthday magic circus celebration tada
🎊 confetti ball festival party birthday circus
🎋 tanabata tree plant nature branch summer
🎍 pine decoration plant nature vegetable panda pine decoration
🎎 japanese dolls japanese toy kimono
🎏 carp streamer fish japanese koinobori carp banner
🎐 wind chime nature ding spring bell
🎑 moon viewing ceremony photo japan asia tsukimi
🧧 red envelope gift
🎀 ribbon decoration pink girl bowtie
🎁 wrapped gift present birthday christmas xmas
🎗️ reminder ribbon sports cause support awareness
🎟️ admission tickets sports concert entrance
🎫 ticket event concert pass
🎖️ military medal award winning army
🏆 trophy win award contest place ftw ceremony
🏅 sports medal award winning
🥇 1st place medal award winning first
🥈 2nd place medal award second
🥉 3rd place medal award third
⚽ soccer ball sports football
⚾ baseball sports balls
🥎 softball sports balls
🏀 basketball sports balls NBA
🏐 volleyball sports balls
🏈 american football sports balls NFL
🏉 rugby football sports team
🎾 tennis sports balls green
🥏 flying disc sports frisbee ultimate
🎳 bowling sports fun play
🏏 cricket game sports
🏑 field hockey sports
🏒 ice hockey sports
🥍 lacrosse sports ball stick
🏓 ping pong sports pingpong
🏸 badminton sports
🥊 boxing glove sports fighting
🥋 martial arts uniform judo karate taekwondo
🥅 goal net sports
⛳ flag in hole sports business flag hole summer
⛸️ ice skate sports
🎣 fishing pole food hobby summer
🤿 diving mask sport ocean
🎽 running shirt play pageant
🎿 skis sports winter cold snow
🛷 sled sleigh luge toboggan
🥌 curling stone sports
🎯 direct hit game play bar target bullseye
🪀 yo yo toy
🪁 kite wind fly
🎱 pool 8 ball pool hobby game luck magic
🔮 crystal ball disco party magic circus fortune teller
🧿 nazar amulet bead charm
🎮 video game play console PS4 Wii GameCube controller
🕹️ joystick game play
🎰 slot machine bet gamble vegas fruit machine luck casino
🎲 game die dice random tabletop play luck
🧩 puzzle piece interlocking puzzle piece
🧸 teddy bear plush stuffed
♠️ spade suit poker cards suits magic
♥️ heart suit poker cards magic suits
♦️ diamond suit poker cards magic suits
♣️ club suit poker cards magic suits
♟️ chess pawn expendable
🃏 joker poker cards game play magic
🀄 mahjong red dragon game play chinese kanji
🎴 flower playing cards game sunset red
🎭 performing arts acting theater drama
🖼️ framed picture photography
🎨 artist palette design paint draw colors
🧵 thread needle sewing spool string
🧶 yarn ball crochet knit
👓 glasses fashion accessories eyesight nerdy dork geek
🕶️ sunglasses face cool accessories
🥽 goggles eyes protection safety
🥼 lab coat doctor experiment scientist chemist
🦺 safety vest protection
👔 necktie shirt suitup formal fashion cloth business
👕 t shirt fashion cloth casual shirt tee
👖 jeans fashion shopping
🧣 scarf neck winter clothes
🧤 gloves hands winter clothes
🧥 coat jacket
🧦 socks stockings clothes
👗 dress clothes fashion shopping
👘 kimono dress fashion women female japanese
🥻 sari dress
🩱 one piece swimsuit fashion
🩲 briefs clothing
🩳 shorts clothing
👙 bikini swimming female woman girl fashion beach summer
👚 woman s clothes fashion shopping bags female
👛 purse fashion accessories money sales shopping
👜 handbag fashion accessory accessories shopping
👝 clutch bag bag accessories shopping
🛍️ shopping bags mall buy purchase
🎒 backpack student education bag backpack
👞 man s shoe fashion male
👟 running shoe shoes sports sneakers
🥾 hiking boot backpacking camping hiking
🥿 flat shoe ballet slip-on slipper
👠 high heeled shoe fashion shoes female pumps stiletto
👡 woman s sandal shoes fashion flip flops
🩰 ballet shoes dance
👢 woman s boot shoes fashion
👑 crown king kod leader royalty lord
👒 woman s hat fashion accessories female lady spring
🎩 top hat magic gentleman classy circus
🎓 graduation cap school college degree university graduation cap hat legal learn education
🧢 billed cap cap baseball
⛑️ rescue worker s helmet construction build
📿 prayer beads dhikr religious
💄 lipstick female girl fashion woman
💍 ring wedding propose marriage valentines diamond fashion jewelry gem engagement
💎 gem stone blue ruby diamond jewelry
🔇 muted speaker sound volume silence quiet
🔈 speaker low volume sound volume silence broadcast
🔉 speaker medium volume volume speaker broadcast
🔊 speaker high volume volume noise noisy speaker broadcast
📢 loudspeaker volume sound
📣 megaphone sound speaker volume
📯 postal horn instrument music
🔔 bell sound notification christmas xmas chime
🔕 bell with slash sound volume mute quiet silent
🎼 musical score treble clef compose
🎵 musical note score tone sound
🎶 musical notes music score
🎙️ studio microphone sing recording artist talkshow
🎚️ level slider scale
🎛️ control knobs dial
🎤 microphone sound music PA sing talkshow
🎧 headphone music score gadgets
📻 radio communication music podcast program
🎷 saxophone music instrument jazz blues
🎸 guitar music instrument
🪉 harp music instrument
🎹 musical keyboard piano instrument compose
🎺 trumpet music brass
🎻 violin music instrument orchestra symphony
🪕 banjo music instructment
🥁 drum music instrument drumsticks snare
📱 mobile phone technology apple gadgets dial
📲 mobile phone with arrow iphone incoming
☎️ telephone technology communication dial telephone
📞 telephone receiver technology communication dial
📟 pager bbcall oldschool 90s
📠 fax machine communication technology
🔋 battery power energy sustain
🔌 electric plug charger power
💻 laptop technology laptop screen display monitor
🖥️ desktop computer technology computing screen
🖨️ printer paper ink
⌨️ keyboard technology computer type input text
🖱️ computer mouse click
🖲️ trackball technology trackpad
💽 computer disk technology record data disk 90s
💾 floppy disk oldschool technology save 90s 80s
💿 optical disk technology dvd disk disc 90s
📀 dvd cd disk disc
🧮 abacus calculation
🎥 movie camera film record
🎞️ film frames movie
📽️ film projector video tape record movie
🎬 clapper board movie film record
📺 television technology program oldschool show television
📷 camera gadgets photography
📸 camera with flash photography gadgets
📹 video camera film record
📼 videocassette record video oldschool 90s 80s
🔍 magnifying glass tilted left search zoom find detective
🔎 magnifying glass tilted right search zoom find detective
🕯️ candle fire wax
💡 light bulb light electricity idea
🔦 flashlight dark camping sight night
🏮 red paper lantern light paper halloween spooky
🪔 diya lamp lighting
📔 notebook with decorative cover classroom notes record paper study
📕 closed book read library knowledge textbook learn
📖 open book book read library knowledge literature learn study
📗 green book read library knowledge study
📘 blue book read library knowledge learn study
📙 orange book read library knowledge textbook study
📚 books literature library study
📓 notebook stationery record notes paper study
📒 ledger notes paper
📃 page with curl documents office paper
📜 scroll documents ancient history paper
📄 page facing up documents office paper information
📰 newspaper press headline
🗞️ rolled up newspaper press headline
📑 bookmark tabs favorite save order tidy
🔖 bookmark favorite label save
🏷️ label sale tag
💰 money bag dollar payment coins sale
💴 yen banknote money sales japanese dollar currency
💵 dollar banknote money sales bill currency
💶 euro banknote money sales dollar currency
💷 pound banknote british sterling money sales bills uk england currency
💸 money with wings dollar bills payment sale
💳 credit card money sales dollar bill payment shopping
🧾 receipt accounting expenses
💹 chart increasing with yen green-square graph presentation stats
💱 currency exchange money sales dollar travel
💲 heavy dollar sign money sales payment currency buck
✉️ envelope letter postal inbox communication
📧 e mail communication inbox
📨 incoming envelope email inbox
📩 envelope with arrow email communication
📤 outbox tray inbox email
📥 inbox tray email documents
📦 package mail gift cardboard box moving
📫 closed mailbox with raised flag email inbox communication
📪 closed mailbox with lowered flag email communication inbox
📬 open mailbox with raised flag email inbox communication
📭 open mailbox with lowered flag email inbox
📮 postbox email letter envelope
🗳️ ballot box with ballot election vote
✏️ pencil stationery write paper writing school study
✒️ black nib pen stationery writing write
🖋️ fountain pen stationery writing write
🖊️ pen stationery writing write
🖌️ paintbrush drawing creativity art
🖍️ crayon drawing creativity
📝 memo write documents stationery pencil paper writing legal exam quiz test study compose
💼 briefcase business documents work law legal job career
📁 file folder documents business office
📂 open file folder documents load
🗂️ card index dividers organizing business stationery
📅 calendar calendar schedule
📆 tear off calendar schedule date planning
🗒️ spiral notepad memo stationery
🗓️ spiral calendar date schedule planning
📇 card index business stationery
📈 chart increasing graph presentation stats recovery business economics money sales good success
📉 chart decreasing graph presentation stats recession business economics money sales bad failure
📊 bar chart graph presentation stats
📋 clipboard stationery documents
📌 pushpin stationery mark here
📍 round pushpin stationery location map here
📎 paperclip documents stationery
🖇️ linked paperclips documents stationery
📏 straight ruler stationery calculate length math school drawing architect sketch
📐 triangular ruler stationery math architect sketch
✂️ scissors stationery cut
🗃️ card file box business stationery
🗄️ file cabinet filing organizing
🗑️ wastebasket bin trash rubbish garbage toss
🔒 locked security password padlock
🔓 unlocked privacy security
🔏 locked with pen security secret
🔐 locked with key security privacy
🔑 key lock door password
🗝️ old key lock door password
🔨 hammer tools build create
🪏 shovel tool
🪓 axe tool chop cut
⛏️ pick tools dig
⚒️ hammer and pick tools build create
🛠️ hammer and wrench tools build create
🗡️ dagger weapon
⚔️ crossed swords weapon
🔫 pistol violence weapon pistol revolver
🏹 bow and arrow sports
🛡️ shield protection security
🔧 wrench tools diy ikea fix maintainer
🔩 nut and bolt handy tools fix
⚙️ gear cog
🗜️ clamp tool
⚖️ balance scale law fairness weight
🦯 probing cane accessibility
🔗 link rings url
⛓️ chains lock arrest
🧰 toolbox tools diy fix maintainer mechanic
🧲 magnet attraction magnetic
⚗️ alembic distilling science experiment chemistry
🧪 test tube chemistry experiment lab science
🧫 petri dish bacteria biology culture lab
🧬 dna biologist genetics life
🔬 microscope laboratory experiment zoomin science study
🔭 telescope stars space zoom science astronomy
📡 satellite antenna communication future radio space
💉 syringe health hospital drugs blood medicine needle doctor nurse
🩸 drop of blood period hurt harm wound
💊 pill health medicine doctor pharmacy drug
🩹 adhesive bandage heal
🩺 stethoscope health
🚪 door house entry exit
🛏️ bed sleep rest
🛋️ couch and lamp read chill
🪑 chair sit furniture
🫟 liquid splat Splatter
🚽 toilet restroom wc washroom bathroom potty
🚿 shower clean water bathroom
🛁 bathtub clean shower bathroom
🪒 razor cut
🧴 lotion bottle moisturizer sunscreen
🧷 safety pin diaper
🧹 broom cleaning sweeping witch
🧺 basket laundry
🧻 roll of paper roll
🧼 soap bar bathing cleaning lather
🧽 sponge absorbing cleaning porous
🧯 fire extinguisher quench
🛒 shopping cart trolley
🚬 cigarette kills tobacco cigarette joint smoke
⚰️ coffin vampire dead die death rip graveyard cemetery casket funeral box
⚱️ funeral urn dead die death rip ashes
🗿 moai rock easter island moai
🏧 atm sign money sales cash blue-square payment bank
🚮 litter in bin sign blue-square sign human info
🚰 potable water blue-square liquid restroom cleaning faucet
♿ wheelchair symbol blue-square disabled accessibility
🚹 men s room toilet restroom wc blue-square gender male
🚺 women s room purple-square woman female toilet loo restroom gender
🚻 restroom blue-square toilet refresh wc gender
🚼 baby symbol orange-square child
🚾 water closet toilet restroom blue-square
🛂 passport control custom blue-square
🛃 customs passport border blue-square
🛄 baggage claim blue-square airport transport
🛅 left luggage blue-square travel
⚠️ warning exclamation wip alert error problem issue
🚸 children crossing school warning danger sign driving yellow-diamond
⛔ no entry limit security privacy bad denied stop circle
🚫 prohibited forbid stop limit denied disallow circle
🚳 no bicycles cyclist prohibited circle
🚭 no smoking cigarette blue-square smell smoke
🚯 no littering trash bin garbage circle
🚱 non potable water drink faucet tap circle
🚷 no pedestrians rules crossing walking circle
📵 no mobile phones iphone mute circle
🔞 no one under eighteen 18 drink pub night minor circle
☢️ radioactive nuclear danger
☣️ biohazard danger
⬆️ up arrow blue-square continue top direction
↗️ up right arrow blue-square point direction diagonal northeast
➡️ right arrow blue-square next
↘️ down right arrow blue-square direction diagonal southeast
⬇️ down arrow blue-square direction bottom
↙️ down left arrow blue-square direction diagonal southwest
⬅️ left arrow blue-square previous back
↖️ up left arrow blue-square point direction diagonal northwest
↕️ up down arrow blue-square direction way vertical
↔️ left right arrow shape direction horizontal sideways
↩️ right arrow curving left back return blue-square undo enter
↪️ left arrow curving right blue-square return rotate direction
⤴️ right arrow curving up blue-square direction top
⤵️ right arrow curving down blue-square direction bottom
🔃 clockwise vertical arrows sync cycle round repeat
🔄 counterclockwise arrows button blue-square sync cycle
🔙 back arrow arrow words return
🔚 end arrow words arrow
🔛 on arrow arrow words
🔜 soon arrow arrow words
🔝 top arrow words blue-square
🛐 place of worship religion church temple prayer
⚛️ atom symbol science physics chemistry
🕉️ om hinduism buddhism sikhism jainism
✡️ star of david judaism
☸️ wheel of dharma hinduism buddhism sikhism jainism
☯️ yin yang balance
✝️ latin cross christianity
☦️ orthodox cross suppedaneum religion
☪️ star and crescent islam
☮️ peace symbol hippie
🕎 menorah hanukkah candles jewish
🔯 dotted six pointed star purple-square religion jewish hexagram
♈ aries sign purple-square zodiac astrology
♉ taurus purple-square sign zodiac astrology
♊ gemini sign zodiac purple-square astrology
♋ cancer sign zodiac purple-square astrology
♌ leo sign purple-square zodiac astrology
♍ virgo sign zodiac purple-square astrology
♎ libra sign purple-square zodiac astrology
♏ scorpio sign zodiac purple-square astrology scorpio
♐ sagittarius sign zodiac purple-square astrology
♑ capricorn sign zodiac purple-square astrology
♒ aquarius sign purple-square zodiac astrology
♓ pisces purple-square sign zodiac astrology
⛎ ophiuchus sign purple-square constellation astrology
🔀 shuffle tracks button blue-square shuffle music random
🔁 repeat button loop record
🔂 repeat single button blue-square loop
▶️ play button blue-square right direction play
⏩ fast forward button blue-square play speed continue
⏭️ next track button forward next blue-square
⏯️ play or pause button blue-square play pause
◀️ reverse button blue-square left direction
⏪ fast reverse button play blue-square
⏮️ last track button backward
🔼 upwards button blue-square triangle direction point forward top
⏫ fast up button blue-square direction top
🔽 downwards button blue-square direction bottom
⏬ fast down button blue-square direction bottom
⏸️ pause button pause blue-square
⏹️ stop button blue-square
⏺️ record button blue-square
⏏️ eject button blue-square
🎦 cinema blue-square record film movie curtain stage theater
🔅 dim button sun afternoon warm summer
🔆 bright button sun light
📶 antenna bars blue-square reception phone internet connection wifi bluetooth bars
📳 vibration mode orange-square phone
📴 mobile phone off mute orange-square silence quiet
♀️ female sign woman women lady girl
♂️ male sign man boy men
⚕️ medical symbol health hospital
♾️ infinity forever
♻️ recycling symbol arrow environment garbage trash
⚜️ fleur de lis decorative scout
🔱 trident emblem weapon spear
📛 name badge fire forbid
🔰 japanese symbol for beginner badge shield
⭕ hollow red circle circle round
✅ check mark button green-square ok agree vote election answer tick
☑️ check box with check ok agree confirm black-square vote election yes tick
✔️ check mark ok nike answer yes tick
✖️ multiplication sign math calculation
❌ cross mark no delete remove cancel red
❎ cross mark button x green-square no deny
➕ plus sign math calculation addition more increase
➖ minus sign math calculation subtract less
➗ division sign divide math calculation
➰ curly loop scribble draw shape squiggle
➿ double curly loop tape cassette
〽️ part alternation mark graph presentation stats business economics bad
✳️ eight spoked asterisk star sparkle green-square
✴️ eight pointed star orange-square shape polygon
❇️ sparkle stars green-square awesome good fireworks
‼️ double exclamation mark exclamation surprise
⁉️ exclamation question mark wat punctuation surprise
❓ question mark doubt confused
❔ white question mark doubts gray huh confused
❕ white exclamation mark surprise punctuation gray wow warning
❗ exclamation mark heavy exclamation mark danger surprise punctuation wow warning
〰️ wavy dash draw line moustache mustache squiggle scribble
©️ copyright ip license circle law legal
®️ registered alphabet circle
™️ trade mark trademark brand law legal
#️⃣ keycap  symbol blue-square twitter
*️⃣ keycap  star keycap
0️⃣ keycap 0 0 numbers blue-square null
1️⃣ keycap 1 blue-square numbers 1
2️⃣ keycap 2 numbers 2 prime blue-square
3️⃣ keycap 3 3 numbers prime blue-square
4️⃣ keycap 4 4 numbers blue-square
5️⃣ keycap 5 5 numbers blue-square prime
6️⃣ keycap 6 6 numbers blue-square
7️⃣ keycap 7 7 numbers blue-square prime
8️⃣ keycap 8 8 blue-square numbers
9️⃣ keycap 9 blue-square numbers 9
🔟 keycap 10 numbers 10 blue-square
🔠 input latin uppercase alphabet words blue-square
🔡 input latin lowercase blue-square alphabet
🔢 input numbers numbers blue-square
🔣 input symbols blue-square music note ampersand percent glyphs characters
🔤 input latin letters blue-square alphabet
🅰️ a button red-square alphabet letter
🆎 ab button red-square alphabet
🅱️ b button red-square alphabet letter
🆑 cl button alphabet words red-square
🆒 cool button words blue-square
🆓 free button blue-square words
ℹ️ information blue-square alphabet letter
🆔 id button purple-square words
Ⓜ️ circled m alphabet blue-circle letter
🆕 new button blue-square words start
🆖 ng button blue-square words shape icon
🅾️ o button alphabet red-square letter
🆗 ok button good agree yes blue-square
🅿️ p button cars blue-square alphabet letter
🆘 sos button help red-square words emergency 911
🆙 up button blue-square above high
🆚 vs button words orange-square
🈁 japanese here button blue-square here katakana japanese destination
🈂️ japanese service charge button japanese blue-square katakana
🈷️ japanese monthly amount button chinese month moon japanese orange-square kanji
🈶 japanese not free of charge button orange-square chinese have kanji
🈯 japanese reserved button chinese point green-square kanji
🉐 japanese bargain button chinese kanji obtain get circle
🈹 japanese discount button cut divide chinese kanji pink-square
🈚 japanese free of charge button nothing chinese kanji japanese orange-square
🈲 japanese prohibited button kanji japanese chinese forbidden limit restricted red-square
🉑 japanese acceptable button ok good chinese kanji agree yes orange-circle
🈸 japanese application button chinese japanese kanji orange-square
🈴 japanese passing grade button japanese chinese join kanji red-square
🈳 japanese vacancy button kanji japanese chinese empty sky blue-square
㊗️ japanese congratulations button chinese kanji japanese red-circle
㊙️ japanese secret button privacy chinese sshh kanji red-circle
🈺 japanese open for business button japanese opening hours orange-square
🈵 japanese no vacancy button full chinese japanese red-square kanji
🔴 red circle shape error danger
🟠 orange circle round
🟡 yellow circle round
🟢 green circle round
🔵 blue circle shape icon button
🟣 purple circle round
🟤 brown circle round
⚫ black circle shape button round
⚪ white circle shape round
🟥 red square
🟧 orange square
🟨 yellow square
🟩 green square
🟦 blue square
🟪 purple square
🟫 brown square
⬛ black large square shape icon button
⬜ white large square shape icon stone button
◼️ black medium square shape button icon
◻️ white medium square shape stone icon
◾ black medium small square icon shape button
◽ white medium small square shape stone icon button
▪️ black small square shape icon
▫️ white small square shape icon
🔶 large orange diamond shape jewel gem
🔷 large blue diamond shape jewel gem
🔸 small orange diamond shape jewel gem
🔹 small blue diamond shape jewel gem
🔺 red triangle pointed up shape direction up top
🔻 red triangle pointed down shape direction bottom
💠 diamond with a dot jewel blue gem crystal fancy
🔘 radio button input old music circle
🔳 white square button shape input
🔲 black square button shape input frame
🏁 chequered flag contest finishline race gokart
🚩 triangular flag mark milestone place
🎌 crossed flags japanese nation country border
🏴 black flag pirate
🏳️ white flag losing loser lost surrender give up fail
🏳️‍🌈 rainbow flag flag rainbow pride gay lgbt glbt queer homosexual lesbian bisexual transgender
🏴‍☠️ pirate flag skull crossbones flag banner
🇦🇨 flag ascension island
🇦🇩 flag andorra ad flag nation country banner andorra
🇦🇪 flag united arab emirates united arab emirates flag nation country banner united arab emirates
🇦🇫 flag afghanistan af flag nation country banner afghanistan
🇦🇬 flag antigua barbuda antigua barbuda flag nation country banner antigua barbuda
🇦🇮 flag anguilla ai flag nation country banner anguilla
🇦🇱 flag albania al flag nation country banner albania
🇦🇲 flag armenia am flag nation country banner armenia
🇦🇴 flag angola ao flag nation country banner angola
🇦🇶 flag antarctica aq flag nation country banner antarctica
🇦🇷 flag argentina ar flag nation country banner argentina
🇦🇸 flag american samoa american ws flag nation country banner american samoa
🇦🇹 flag austria at flag nation country banner austria
🇦🇺 flag australia au flag nation country banner australia
🇦🇼 flag aruba aw flag nation country banner aruba
🇦🇽 flag aland islands Åland islands flag nation country banner aland islands
🇦🇿 flag azerbaijan az flag nation country banner azerbaijan
🇧🇦 flag bosnia herzegovina bosnia herzegovina flag nation country banner bosnia herzegovina
🇧🇧 flag barbados bb flag nation country banner barbados
🇧🇩 flag bangladesh bd flag nation country banner bangladesh
🇧🇪 flag belgium be flag nation country banner belgium
🇧🇫 flag burkina faso burkina faso flag nation country banner burkina faso
🇧🇬 flag bulgaria bg flag nation country banner bulgaria
🇧🇭 flag bahrain bh flag nation country banner bahrain
🇧🇮 flag burundi bi flag nation country banner burundi
🇧🇯 flag benin bj flag nation country banner benin
🇧🇱 flag st barthelemy saint barthélemy flag nation country banner st barthelemy
🇧🇲 flag bermuda bm flag nation country banner bermuda
🇧🇳 flag brunei bn darussalam flag nation country banner brunei
🇧🇴 flag bolivia bo flag nation country banner bolivia
🇧🇶 flag caribbean netherlands bonaire flag nation country banner caribbean netherlands
🇧🇷 flag brazil br flag nation country banner brazil
🇧🇸 flag bahamas bs flag nation country banner bahamas
🇧🇹 flag bhutan bt flag nation country banner bhutan
🇧🇻 flag bouvet island norway
🇧🇼 flag botswana bw flag nation country banner botswana
🇧🇾 flag belarus by flag nation country banner belarus
🇧🇿 flag belize bz flag nation country banner belize
🇨🇦 flag canada ca flag nation country banner canada
🇨🇨 flag cocos islands cocos keeling islands flag nation country banner cocos islands
🇨🇩 flag congo kinshasa congo democratic republic flag nation country banner congo kinshasa
🇨🇫 flag central african republic central african republic flag nation country banner central african republic
🇨🇬 flag congo brazzaville congo flag nation country banner congo brazzaville
🇨🇭 flag switzerland ch flag nation country banner switzerland
🇨🇮 flag cote d ivoire ivory coast flag nation country banner cote d ivoire
🇨🇰 flag cook islands cook islands flag nation country banner cook islands
🇨🇱 flag chile flag nation country banner chile
🇨🇲 flag cameroon cm flag nation country banner cameroon
🇨🇳 flag china china chinese prc flag country nation banner china
🇨🇴 flag colombia co flag nation country banner colombia
🇨🇵 flag clipperton island
🇨🇷 flag costa rica costa rica flag nation country banner costa rica
🇨🇺 flag cuba cu flag nation country banner cuba
🇨🇻 flag cape verde cabo verde flag nation country banner cape verde
🇨🇼 flag curacao curaçao flag nation country banner curacao
🇨🇽 flag christmas island christmas island flag nation country banner christmas island
🇨🇾 flag cyprus cy flag nation country banner cyprus
🇨🇿 flag czechia cz flag nation country banner czechia
🇩🇪 flag germany german nation flag country banner germany
🇩🇬 flag diego garcia
🇩🇯 flag djibouti dj flag nation country banner djibouti
🇩🇰 flag denmark dk flag nation country banner denmark
🇩🇲 flag dominica dm flag nation country banner dominica
🇩🇴 flag dominican republic dominican republic flag nation country banner dominican republic
🇩🇿 flag algeria dz flag nation country banner algeria
🇪🇦 flag ceuta melilla
🇪🇨 flag ecuador ec flag nation country banner ecuador
🇪🇪 flag estonia ee flag nation country banner estonia
🇪🇬 flag egypt eg flag nation country banner egypt
🇪🇭 flag western sahara western sahara flag nation country banner western sahara
🇪🇷 flag eritrea er flag nation country banner eritrea
🇪🇸 flag spain spain flag nation country banner spain
🇪🇹 flag ethiopia et flag nation country banner ethiopia
🇪🇺 flag european union european union flag banner
🇫🇮 flag finland fi flag nation country banner finland
🇫🇯 flag fiji fj flag nation country banner fiji
🇫🇰 flag falkland islands falkland islands malvinas flag nation country banner falkland islands
🇫🇲 flag micronesia micronesia federated states flag nation country banner micronesia
🇫🇴 flag faroe islands faroe islands flag nation country banner faroe islands
🇫🇷 flag france banner flag nation france french country france
🇬🇦 flag gabon ga flag nation country banner gabon
🇬🇧 flag united kingdom united kingdom great britain northern ireland flag nation country banner british UK english england union jack united kingdom
🇬🇩 flag grenada gd flag nation country banner grenada
🇬🇪 flag georgia ge flag nation country banner georgia
🇬🇫 flag french guiana french guiana flag nation country banner french guiana
🇬🇬 flag guernsey gg flag nation country banner guernsey
🇬🇭 flag ghana gh flag nation country banner ghana
🇬🇮 flag gibraltar gi flag nation country banner gibraltar
🇬🇱 flag greenland gl flag nation country banner greenland
🇬🇲 flag gambia gm flag nation country banner gambia
🇬🇳 flag guinea gn flag nation country banner guinea
🇬🇵 flag guadeloupe gp flag nation country banner guadeloupe
🇬🇶 flag equatorial guinea equatorial gn flag nation country banner equatorial guinea
🇬🇷 flag greece gr flag nation country banner greece
🇬🇸 flag south georgia south sandwich islands south georgia sandwich islands flag nation country banner south georgia south sandwich islands
🇬🇹 flag guatemala gt flag nation country banner guatemala
🇬🇺 flag guam gu flag nation country banner guam
🇬🇼 flag guinea bissau gw bissau flag nation country banner guinea bissau
🇬🇾 flag guyana gy flag nation country banner guyana
🇭🇰 flag hong kong sar china hong kong flag nation country banner hong kong sar china
🇭🇲 flag heard mcdonald islands
🇭🇳 flag honduras hn flag nation country banner honduras
🇭🇷 flag croatia hr flag nation country banner croatia
🇭🇹 flag haiti ht flag nation country banner haiti
🇭🇺 flag hungary hu flag nation country banner hungary
🇮🇨 flag canary islands canary islands flag nation country banner canary islands
🇮🇩 flag indonesia flag nation country banner indonesia
🇮🇪 flag ireland ie flag nation country banner ireland
🇮🇱 flag israel il flag nation country banner israel
🇮🇲 flag isle of man isle man flag nation country banner isle of man
🇮🇳 flag india in flag nation country banner india
🇮🇴 flag british indian ocean territory british indian ocean territory flag nation country banner british indian ocean territory
🇮🇶 flag iraq iq flag nation country banner iraq
🇮🇷 flag iran iran islamic republic flag nation country banner iran
🇮🇸 flag iceland is flag nation country banner iceland
🇮🇹 flag italy italy flag nation country banner italy
🇯🇪 flag jersey je flag nation country banner jersey
🇯🇲 flag jamaica jm flag nation country banner jamaica
🇯🇴 flag jordan jo flag nation country banner jordan
🇯🇵 flag japan japanese nation flag country banner japan
🇰🇪 flag kenya ke flag nation country banner kenya
🇰🇬 flag kyrgyzstan kg flag nation country banner kyrgyzstan
🇰🇭 flag cambodia kh flag nation country banner cambodia
🇰🇮 flag kiribati ki flag nation country banner kiribati
🇰🇲 flag comoros km flag nation country banner comoros
🇰🇳 flag st kitts nevis saint kitts nevis flag nation country banner st kitts nevis
🇰🇵 flag north korea north korea nation flag country banner north korea
🇰🇷 flag south korea south korea nation flag country banner south korea
🇰🇼 flag kuwait kw flag nation country banner kuwait
🇰🇾 flag cayman islands cayman islands flag nation country banner cayman islands
🇰🇿 flag kazakhstan kz flag nation country banner kazakhstan
🇱🇦 flag laos lao democratic republic flag nation country banner laos
🇱🇧 flag lebanon lb flag nation country banner lebanon
🇱🇨 flag st lucia saint lucia flag nation country banner st lucia
🇱🇮 flag liechtenstein li flag nation country banner liechtenstein
🇱🇰 flag sri lanka sri lanka flag nation country banner sri lanka
🇱🇷 flag liberia lr flag nation country banner liberia
🇱🇸 flag lesotho ls flag nation country banner lesotho
🇱🇹 flag lithuania lt flag nation country banner lithuania
🇱🇺 flag luxembourg lu flag nation country banner luxembourg
🇱🇻 flag latvia lv flag nation country banner latvia
🇱🇾 flag libya ly flag nation country banner libya
🇲🇦 flag morocco ma flag nation country banner morocco
🇲🇨 flag monaco mc flag nation country banner monaco
🇲🇩 flag moldova moldova republic flag nation country banner moldova
🇲🇪 flag montenegro me flag nation country banner montenegro
🇲🇫 flag st martin
🇲🇬 flag madagascar mg flag nation country banner madagascar
🇲🇭 flag marshall islands marshall islands flag nation country banner marshall islands
🇲🇰 flag north macedonia macedonia flag nation country banner north macedonia
🇲🇱 flag mali ml flag nation country banner mali
🇲🇲 flag myanmar mm flag nation country banner myanmar
🇲🇳 flag mongolia mn flag nation country banner mongolia
🇲🇴 flag macao sar china macao flag nation country banner macao sar china
🇲🇵 flag northern mariana islands northern mariana islands flag nation country banner northern mariana islands
🇲🇶 flag martinique mq flag nation country banner martinique
🇲🇷 flag mauritania mr flag nation country banner mauritania
🇲🇸 flag montserrat ms flag nation country banner montserrat
🇲🇹 flag malta mt flag nation country banner malta
🇲🇺 flag mauritius mu flag nation country banner mauritius
🇲🇻 flag maldives mv flag nation country banner maldives
🇲🇼 flag malawi mw flag nation country banner malawi
🇲🇽 flag mexico mx flag nation country banner mexico
🇲🇾 flag malaysia my flag nation country banner malaysia
🇲🇿 flag mozambique mz flag nation country banner mozambique
🇳🇦 flag namibia na flag nation country banner namibia
🇳🇨 flag new caledonia new caledonia flag nation country banner new caledonia
🇳🇪 flag niger ne flag nation country banner niger
🇳🇫 flag norfolk island norfolk island flag nation country banner norfolk island
🇳🇬 flag nigeria flag nation country banner nigeria
🇳🇮 flag nicaragua ni flag nation country banner nicaragua
🇳🇱 flag netherlands nl flag nation country banner netherlands
🇳🇴 flag norway no flag nation country banner norway
🇳🇵 flag nepal np flag nation country banner nepal
🇳🇷 flag nauru nr flag nation country banner nauru
🇳🇺 flag niue nu flag nation country banner niue
🇳🇿 flag new zealand new zealand flag nation country banner new zealand
🇴🇲 flag oman om symbol flag nation country banner oman
🇵🇦 flag panama pa flag nation country banner panama
🇵🇪 flag peru pe flag nation country banner peru
🇵🇫 flag french polynesia french polynesia flag nation country banner french polynesia
🇵🇬 flag papua new guinea papua new guinea flag nation country banner papua new guinea
🇵🇭 flag philippines ph flag nation country banner philippines
🇵🇰 flag pakistan pk flag nation country banner pakistan
🇵🇱 flag poland pl flag nation country banner poland
🇵🇲 flag st pierre miquelon saint pierre miquelon flag nation country banner st pierre miquelon
🇵🇳 flag pitcairn islands pitcairn flag nation country banner pitcairn islands
🇵🇷 flag puerto rico puerto rico flag nation country banner puerto rico
🇵🇸 flag palestinian territories palestine palestinian territories flag nation country banner palestinian territories
🇵🇹 flag portugal pt flag nation country banner portugal
🇵🇼 flag palau pw flag nation country banner palau
🇵🇾 flag paraguay py flag nation country banner paraguay
🇶🇦 flag qatar qa flag nation country banner qatar
🇷🇪 flag reunion réunion flag nation country banner reunion
🇷🇴 flag romania ro flag nation country banner romania
🇷🇸 flag serbia rs flag nation country banner serbia
🇷🇺 flag russia russian federation flag nation country banner russia
🇷🇼 flag rwanda rw flag nation country banner rwanda
🇸🇦 flag saudi arabia flag nation country banner saudi arabia
🇸🇧 flag solomon islands solomon islands flag nation country banner solomon islands
🇸🇨 flag seychelles sc flag nation country banner seychelles
🇸🇩 flag sudan sd flag nation country banner sudan
🇸🇪 flag sweden se flag nation country banner sweden
🇸🇬 flag singapore sg flag nation country banner singapore
🇸🇭 flag st helena saint helena ascension tristan cunha flag nation country banner st helena
🇸🇮 flag slovenia si flag nation country banner slovenia
🇸🇯 flag svalbard jan mayen
🇸🇰 flag slovakia sk flag nation country banner slovakia
🇸🇱 flag sierra leone sierra leone flag nation country banner sierra leone
🇸🇲 flag san marino san marino flag nation country banner san marino
🇸🇳 flag senegal sn flag nation country banner senegal
🇸🇴 flag somalia so flag nation country banner somalia
🇸🇷 flag suriname sr flag nation country banner suriname
🇸🇸 flag south sudan south sd flag nation country banner south sudan
🇸🇹 flag sao tome principe sao tome principe flag nation country banner sao tome principe
🇸🇻 flag el salvador el salvador flag nation country banner el salvador
🇸🇽 flag sint maarten sint maarten dutch flag nation country banner sint maarten
🇸🇾 flag syria syrian arab republic flag nation country banner syria
🇸🇿 flag eswatini sz flag nation country banner eswatini
🇹🇦 flag tristan da cunha
🇹🇨 flag turks caicos islands turks caicos islands flag nation country banner turks caicos islands
🇹🇩 flag chad td flag nation country banner chad
🇹🇫 flag french southern territories french southern territories flag nation country banner french southern territories
🇹🇬 flag togo tg flag nation country banner togo
🇹🇭 flag thailand th flag nation country banner thailand
🇹🇯 flag tajikistan tj flag nation country banner tajikistan
🇹🇰 flag tokelau tk flag nation country banner tokelau
🇹🇱 flag timor leste timor leste flag nation country banner timor leste
🇹🇲 flag turkmenistan flag nation country banner turkmenistan
🇹🇳 flag tunisia tn flag nation country banner tunisia
🇹🇴 flag tonga to flag nation country banner tonga
🇹🇷 flag turkey turkey flag nation country banner turkey
🇹🇹 flag trinidad tobago trinidad tobago flag nation country banner trinidad tobago
🇹🇻 flag tuvalu flag nation country banner tuvalu
🇹🇼 flag taiwan tw flag nation country banner taiwan
🇹🇿 flag tanzania tanzania united republic flag nation country banner tanzania
🇺🇦 flag ukraine ua flag nation country banner ukraine
🇺🇬 flag uganda ug flag nation country banner uganda
🇺🇲 flag u s outlying islands
🇺🇳 flag united nations un flag banner
🇺🇸 flag united states united states america flag nation country banner united states
🇺🇾 flag uruguay uy flag nation country banner uruguay
🇺🇿 flag uzbekistan uz flag nation country banner uzbekistan
🇻🇦 flag vatican city vatican city flag nation country banner vatican city
🇻🇨 flag st vincent grenadines saint vincent grenadines flag nation country banner st vincent grenadines
🇻🇪 flag venezuela ve bolivarian republic flag nation country banner venezuela
🇻🇬 flag british virgin islands british virgin islands bvi flag nation country banner british virgin islands
🇻🇮 flag u s virgin islands virgin islands us flag nation country banner u s virgin islands
🇻🇳 flag vietnam viet nam flag nation country banner vietnam
🇻🇺 flag vanuatu vu flag nation country banner vanuatu
🇼🇫 flag wallis futuna wallis futuna flag nation country banner wallis futuna
🇼🇸 flag samoa ws flag nation country banner samoa
🇽🇰 flag kosovo xk flag nation country banner kosovo
🇾🇪 flag yemen ye flag nation country banner yemen
🇾🇹 flag mayotte yt flag nation country banner mayotte
🇿🇦 flag south africa south africa flag nation country banner south africa
🇿🇲 flag zambia zm flag nation country banner zambia
🇿🇼 flag zimbabwe zw flag nation country banner zimbabwe
🏴󠁧󠁢󠁥󠁮󠁧󠁿 flag england flag english
🏴󠁧󠁢󠁳󠁣󠁴󠁿 flag scotland flag scottish
🏴󠁧󠁢󠁷󠁬󠁳󠁿 flag wales flag welsh
🇨🇶 flag sark flag Sercq
🥲 smiling face with tear sad cry pretend
🥸 disguised face pretent brows glasses moustache
🤌 pinched fingers size tiny small
🫀 anatomical heart health heartbeat
🫁 lungs breathe
🥷 ninja ninjutsu skills japanese
🤵‍♂️ man in tuxedo formal fashion
🤵‍♀️ woman in tuxedo formal fashion
👰‍♂️ man with veil wedding marriage
👰‍♀️ woman with veil wedding marriage
👩‍🍼 woman feeding baby birth food
👨‍🍼 man feeding baby birth food
🧑‍🍼 person feeding baby birth food
🧑‍🎄 mx claus christmas
🫂 people hugging care
🐈‍⬛ black cat superstition luck
🦬 bison ox
🦣 mammoth elephant tusks
🦫 beaver animal rodent
🐻‍❄️ polar bear animal arctic
🦤 dodo animal bird
🪶 feather bird fly
🦭 seal animal creature sea
🪲 beetle insect
🪳 cockroach insect pests
🪰 fly insect
🪱 worm animal
🪴 potted plant greenery house
🫐 blueberries fruit
🫒 olive fruit
🫑 bell pepper fruit plant
🫓 flatbread flour food
🫔 tamale food masa
🫕 fondue cheese pot food
🫖 teapot drink hot
🧋 bubble tea taiwan boba milk tea straw
🪨 rock stone
🪵 wood nature timber trunk
🛖 hut house structure
🛻 pickup truck car transportation
🛼 roller skate footwear sports
🪄 magic wand supernature power
🪅 pinata mexico candy celebration
🪆 nesting dolls matryoshka toy
🪡 sewing needle stitches
🪢 knot rope scout
🩴 thong sandal footwear summer
🪖 military helmet army protection
🪗 accordion music
🪘 long drum music
🪙 coin money currency
🪃 boomerang weapon
🪚 carpentry saw cut chop
🪛 screwdriver tools
🪝 hook tools
🪜 ladder tools
🛗 elevator lift
🪞 mirror reflection
🪟 window scenery
🪠 plunger toilet
🪤 mouse trap cheese
🪣 bucket water container
🪥 toothbrush hygiene dental
🪦 headstone death rip grave
🪧 placard announcement
⚧️ transgender symbol lgbtq
🏳️‍⚧️ transgender flag lgbtq
😶‍🌫️ face in clouds shower steam dream
😮‍💨 face exhaling relieve relief tired sigh
😵‍💫 face with spiral eyes sick ill confused nauseous nausea
❤️‍🔥 heart on fire passionate enthusiastic
❤️‍🩹 mending heart broken heart bandage wounded
🧔‍♂️ man beard facial hair
🧔‍♀️ woman beard facial hair
🫠 melting face hot heat
🫢 face with open eyes and hand over mouth silence secret shock surprise
🫣 face with peeking eye scared frightening embarrassing
🫡 saluting face respect salute
🫥 dotted line face invisible lonely isolation depression
🫤 face with diagonal mouth skeptic confuse frustrated indifferent
🥹 face holding back tears touched gratitude
🫱 rightwards hand palm offer
🫲 leftwards hand palm offer
🫳 palm down hand palm drop
🫴 palm up hand lift offer demand
🫰 hand with index finger and thumb crossed heart love money expensive
🫵 index pointing at the viewer you recruit
🫶 heart hands love appreciation support
🫦 biting lip flirt sexy pain worry
🫅 person with crown royalty power
🫃 pregnant man baby belly
🫄 pregnant person baby belly
🧌 troll mystical monster
🪸 coral ocean sea reef
🪷 lotus flower calm meditation
🪹 empty nest bird
🪺 nest with eggs bird
🫘 beans food
🫗 pouring liquid cup water
🫙 jar container sauce
🛝 playground slide fun park
🛞 wheel car transport
🛟 ring buoy life saver life preserver
🪬 hamsa religion protection
🪩 mirror ball disco dance party
🪫 low battery drained dead
🩼 crutch accessibility assist
🩻 x-ray skeleton medicine
🫧 bubbles soap fun carbonation sparkling
🪪 identification card document
🟰 heavy equals sign math
¿? question upside down reversed spanish
← left arrow
↑ up arrow
→ right arrow
↓ down arrow
←↑→↓ all directions up down left right arrows
AH↗️HA↘️HA↗️HA↘️HA↗️HA↘️HA↗️HA↘️ pekora arrows hahaha rabbit
• dot circle separator
「」 japanese quote square bracket
¯\_(ツ)_/¯ shrug idk i dont know
↵ enter key return
𝕏  twitter x logo
👉👈 etou ughhhhhhh shy
👉👌 put it in imagination perv
