// ==UserScript==
// @name        redirector
// @namespace   Violentmonkey Scripts
// @match       https://twitter.com/*
// @match       https://reddit.com/*
// @grant       none
// @version     1.0
// @author      -
// @description 7/30/2022, 5:34:35 PM
// ==/UserScript==

let hostname = window.location.hostname;
let path = window.location.pathname;
let query = window.location.search;

let redirects = {
  "twitter.com": "nitter.projectsegfau.lt",
  "reddit.com": "libreddit.projectsegfau.lt",
};

let redirect = redirects[hostname];
if (redirect) window.location = `https://${redirect}${path}${query}`;
