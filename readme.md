# Segment Cookie Web Content for Liferay DXP 7.2

A web-content structure for setting cookies on pages that can be used with Liferay's Segments.

### Instructions

- Add `segmentCookie.json` as a web-content structure.
- Add `segmentCookie.ftl` as a web-content template.
- Create a segment using the cookie rule.

![web-content](/segment.png)

- Create a new web-content using the segment cookie template.
- Make sure the `key` and `value` are the same for your segment and your web-content.

![web-content](/web-content.png)

- Add the newly created web-content to any page you want to use to segment your users. 


This rule will now work similar to the score point rule that was available in Audience Targeting on 7.0. 

### Localhost

Some cookie behaviors may not work as expected when using localhost. If you have some issues, try setting a local domain in your host file. 

### Domain

Domain is optional. If you set a domain it must match the actual domain of your site. The format should be 'example.com'. Localhost will not work. You can set a local domain in your host file, something like 'liferay.demo'.

### Additional Notes

Open your javascript console to see logs of what's happening.

When on a page that includes this web-content you can run `resetSegmentCookie()` in the javascript console to reset the visits count. This can be helpful for demo scenarios. 

If using Chrome, cookies can also be removed from the Chrome DevTools.

![web-content](/chromeDevTools.png)

Also, the visits count will not increment while editing a content page. 

I hope you enjoy it. 

Create an issue if there are any issues or if you have any ideas on how to improve it.

### To Do

Add in support for cookie expiration.