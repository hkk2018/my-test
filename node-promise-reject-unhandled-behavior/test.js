let p = new Promise((res, rej) => { setTimeout(() => rej(), 1000) });
// reject的時候有偵測到已catch就不會報錯，否則會

specialCatch(p);

function specialCatch(prom) {
    setTimeout(() => {
        prom.catch(console.log);　//catch沒handler也會報錯唷
    }, 500)
}
