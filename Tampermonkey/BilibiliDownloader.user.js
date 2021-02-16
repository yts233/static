// ==UserScript==
// @name         Bilibili Downloader
// @namespace    https://static.yts233.tk/Tampermonkey/BilibiliDownloader/script.user.js
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://www.bilibili.com/*
// @grant        none
// ==/UserScript==

(async function () {
    'use strict';
    var video = __INITIAL_STATE__.videoData ?? __INITIAL_STATE__.videoInfo;
    var aid = video.aid;
    var bvid = video.bvid;
    var cid = video.cid;
    var getPlayUrlApi = async(cid, bvid, quality) => await(await fetch(`https://api.bilibili.com/x/player/playurl?cid=${cid}&bvid=${bvid}&qn=${quality}`)).json().data;
    var qualities = (await getPlayUrlApi(cid, bvid, 32)).accept_quality;
    window.downloader = {
        aid: aid,
        bvid: bvid,
        cid: cid,
        qualities: qualities,
        getPlayUrl: async function (quality) {
            return await getPlayUrlApi(cid, bvid, quality);
        },
        download: async function (quality) {
            var actor = document.createElement('a');
            actor.href = await getPlayUrlApi(cid.bvid, quality);
            actor.download = `${video.title}.${aid}.flv`;
            actor.click();
        }
    }
})();
