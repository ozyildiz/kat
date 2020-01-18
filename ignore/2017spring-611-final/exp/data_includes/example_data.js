var shuffleSequence = seq("intro", "practice", "p", "devam", "e", "f", "son", "c", "n");
//var shuffleSequence = seq("p", "devam", "e", "f", "son", "c", "n");
//var shuffleSequence = seq("n", "c");

var showProgressBar = false;
var centerItems = true;

var defaults = [
    
    "Message", {
        hideProgressBar: false,
    },
    
    "Question", {
        hasCorrect: true
    },
    "Form", {
        hideProgressBar: false,
        continueOnReturn: true,
        saveReactionTime: true,
        continueMessage: "Devam",
        countsForProgressBar: true
}
    
];

var items = [

    ["sr", "__SendResults__", { }],

    ["sep", "Separator", { }],
    // Ara formlar
    ["intro", "Form", {
        html: { include: "example_intro.html" },
        validators: {
            age: function (s) { if (s.match(/^\d+$/)) return true; else return "Bu alana sayı lazım."; }
        }
    } ],    
        ["intro", "Form", {
        html: { include: "audio-adjust.html" },
    } ],
        ["intro", "Form", {
        html: { include: "practice.html" },
    } ],
    
      ["devam", "Form", {
        html: { include: "devam.html" },
    } ],    
    
    ["son", "Form", {
        html: { include: "son.html" },
    } ], 
    // Itemler
["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/1-e-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["sanıyor", "biliyor"]}],


["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/4-e-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["hatırlıyor","düşünüyor"]}],
["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/5-e-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["biliyor", "sanıyor"]}],


["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/8-e-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["düşünüyor","hatırlıyor"]}],
["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/9-e-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["sanıyor", "biliyor"]}],


["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/12-e-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["hatırlıyor","düşünüyor"]}],
["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/13-e-ikb.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["biliyor", "sanıyor"]}],


["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/16-e-ikb.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["düşünüyor","hatırlıyor"]}],
["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/17-e-ikb.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["sanıyor", "biliyor"]}],


["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/20-e-de.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["hatırlıyor","düşünüyor"]}],
["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/21-e-de.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["biliyor", "sanıyor"]}],


["e", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/24-e-de.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["düşünüyor","hatırlıyor"]}],
["f", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/25-f-de.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["gördü","özledi"]}],
["f", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/26-f-ikb.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["özledi","gördü"]}],
["f", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/27-f-de.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["gördü","özledi"]}],
["f", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/28-f-ikb.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["özledi","gördü"]}],
["f", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/29-f-de.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["gördü","özledi"]}],
["f", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/30-f-ikb.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["unuttu","fark etti"]}],
["f", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/31-f-de.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["fark etti","unuttu"]}],
["f", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/32-f-ikb.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["unuttu","fark etti"]}],
["f", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/33-f-de.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["fark etti","unuttu"]}],
["f", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/34-f-ikb.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["unuttu","fark etti"]}],
["p", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/35-p-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["barış","savaş"]}],
["p", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/36-p-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["kaçırdı","arayacak"]}],
["p", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/37-p-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["mi","valla"]}],
["p", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/38-p-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["kitapları","kahveleri"]}],
["n", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/39-n-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["Ayşe'nin düşüncesi yağmur yağmıyor şeklinde.","Ayşe'nin düşüncesi yağmur yağıyor şeklinde değil."]}],
["n", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/40-n-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["Başkanın düşüncesi ortak bir karara varmak zor olmayacak şeklinde.","Başkanın düşüncesi ortak bir karara varmak zor olacak şeklinde değil."]}],
["c", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/41-c-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["Öğretmen Paris'te yaşamış.","Öğretmen Paris'te yaşamamış olabilir."]}],
["c", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/42-c-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["Öğretmen Paris'te yaşamış.","Öğretmen Paris'te yaşamamış olabilir."]}],
["c", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/43-c-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["Referandumu yüzde yüzle kazanmış.","Referandumu yüzde yüzle kazanmamış olabilir."]}],
["c", "AudioMessage", {html: "<center>+</center><audio class='audio-message' src='http://deniz.fr/prosody/44-c-do.wav' type='audio/wav' autoplay></audio>", transfer:"audio-end"}, "Question", {q: "", as:["Referandumu yüzde yüzle kazanmış.","Referandumu yüzde yüzle kazanmamış olabilir."]}],

 
];
