// ==UserScript==
// @name         Bilibili Downloader
// @namespace    https://static.yts233.tk/Tampermonkey/BilibiliDownloader.user.js
// @version      0.1
// @description  try to take over the world!
// @author       Ye_Tianshun
// @match        https://www.bilibili.com/*
// @grant        none
// ==/UserScript==

(async function () {
    'use strict';
    var video = window.__INITIAL_STATE__.videoData ?? window.__INITIAL_STATE__.videoInfo;
    var aid = video.aid;
    var bvid = video.bvid;
    var cid = video.cid;
    var getPlayUrlApi = async(quality) => (await(await fetch(`https://api.bilibili.com/x/player/playurl?cid=${cid}&bvid=${bvid}&qn=${quality}`)).json()).data;
    var qualities = (await getPlayUrlApi(32)).accept_quality;
    window.downloader = {
        aid: aid,
        bvid: bvid,
        cid: cid,
        title: video.title,
        qualities: qualities,
        getPlayUrl: async function (quality = qualities[0]) {
            return (await getPlayUrlApi(quality)).durl[0].url;
        },
        download: async function (quality = qualities[0]) {
            var actor = document.createElement('a');
            actor.href = (await getPlayUrlApi(quality)).durl[0].url;
            actor.download = `${video.title}.${aid}.flv`;
            actor.click();
        }
    }
})();
