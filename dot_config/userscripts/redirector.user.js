// ==UserScript==
// @name        redirector
// @namespace   Violentmonkey Scripts
// @match       https://www.reddit.com/*
// @grant       none
// @version     1.3
// @author      -
// ==/UserScript==

let hostname = window.location.hostname;
let path = window.location.pathname;
let query = window.location.search;

let redirects = {
  "www.reddit.com": "libreddit.projectsegfau.lt",
};

let redirect = redirects[hostname];
if (redirect) window.location = `https://${redirect}${path}${query}`;
