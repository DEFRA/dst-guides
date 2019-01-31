# Accessibility checklist

[Accessibility](accessibility.md) is about more than checklists. However, a checklist like the one below will give you an objective idea whether your service meets a minimum standard.

The following tests are a simplified version of the [WebAIM checklist](https://webaim.org/standards/wcag/checklist). They refer to the mandatory [Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/glance/) at level A and AA.

## Navigation

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Zoom the browser to 200% and navigate through the service.|Content overlaps on zoom or exceeds screen width|[1.4.4](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-scale.html)||
|2|Navigate using only a keyboard. When tabbing, check that it's obvious where the focus lies and that it's impossible to get trapped.|Being unable to tab to buttons or links.|[2.1.1](https://www.w3.org/TR/UNDERSTANDING-WCAG20/keyboard-operation-keyboard-operable.html)<br>[2.1.2](https://www.w3.org/TR/UNDERSTANDING-WCAG20/keyboard-operation-trapping.html)<br>[2.4.3](https://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-focus-order.html)<br>[2.4.7](https://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-focus-visible.html)||
|3|Check that there are no disorienting changes (such as popups or a loss of keyboard focus) without prior warning. Where hover-over content appears, ensure that the content itself can be hovered over or dismissed, and remains visible until dismissed or no longer relevant.|A delete button, which, upon activation, shows an "Are you sure?" popup. A hover-over explanation which disappears when you zoom out to view it.|[1.4.13](https://www.w3.org/WAI/WCAG21/Understanding/content-on-hover-or-focus.html)<br>[3.2.1](https://www.w3.org/TR/UNDERSTANDING-WCAG20/consistent-behavior-receive-focus.html)<br>[3.2.2](https://www.w3.org/TR/UNDERSTANDING-WCAG20/consistent-behavior-unpredictable-change.html)||
|4|Spot check pages for a "Skip to main content" link at the top (use Shift+Tab), and access it. If there is no link, check that the headings are in a logical structure.|No 'skip' link, or link doesn't work properly|[2.4.1](https://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-skip.html)||
|5|Check that it is easy to move between sections of the service. A short journey may only require back links and continue buttons. A longer journey may require step-by-step navigation.|Long, drawn out user journey with no easy way to go back and correct errors.|[2.4.5](https://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-mult-loc.html)||

## Visual and audio

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Check colour and contrast throughout. Ensure colour is never the only means of conveying information, and there are no areas of low contrast on the screen.  Use WAVE, or another contrast checker if unsure.|Traffic lights to determine status. Red formatting, with no extra text, to highlight errors. Icons and notifications have insufficient contrast.|[1.4.1](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-without-color.html)<br>[1.4.3](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html)<br>[1.4.11](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html)||
|2|Ensure no essential information is conveyed solely through images, sound, video, shapes, or screen location.|A need to use a visual or audio element (such as a map, captcha, beep or video) in order to progress.|[1.2.1](https://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-av-only-alt.html)<br>[1.2.2](https://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-captions.html)<br>[1.2.3](https://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-audio-desc.html)<br>[1.2.4](https://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-real-time-captions.html)<br>[1.2.5](https://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-audio-desc-only.html)<br>[1.3.3](https://www.w3.org/TR/UNDERSTANDING-WCAG20/content-structure-separation-understanding.html)<br>[1.4.2](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-dis-audio.html)<br>[1.4.5](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-text-presentation.html)||

## Content

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Check for plain English, with relevant information coming first, consistent use of terms, and no unnecessary or duplicated text.|Essential information appearing after a Start or Continue button. Unnecessary jargon or abbreviations.|[1.1.1](https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html)<br>1.3.2<br>3.2.3<br>3.2.4||
|2|Check for guidance text within form labels.|User needs to create a password but isn't told beforehand that it needs to contain a digit.|3.3.1<br>3.3.2||
|3|Check that text spacing can be reasonably adjusted.|Changing line spacing to 1.5x line height causes text to be hidden.|1.4.12||

## Mobile

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Check pages in portrait and landscape modes. All content should be visible, the right way up, and two-dimensional scrolling should not be required.|Horizonal and vertical scrollbars need to be used.Content doesn't rotate with the mobile.|1.3.4<br>1.4.10||
|2|Check that you can navigate the service without relying on gestures, such as dragging, pinching or shaking a device, and that these gestures can be disabled.|A map which can only be zoomed using a pinch gesture. A "shake to undo" function that can't be turned off.|2.5.1<br>2.5.4||

## Status

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Leave mandatory fields blank, or enter incorrect values. Ensure that it's clear what the error is, what the user needs to do to fix it, and that there is a link to the error.|Popup errors, or fields turning red with no additional prompt.|3.3.1<br>3.3.3||
|2|Where a user submits financial, legal or test information, ensure they have a chance to check and amend it before submitting it.|No ability to correct errors|3.3.4||
|3|Where the status of an action (such as a payment) changes, ensure the user receives confirmation of this without interrupting their flow.|No confirmation provided back to user.|3.3.4||
|4|Ensure that actions don't take place as soon as the pointer is pressed down on a button, and can be easily cancelled by moving the pointer away.|A pop-up window opens as soon as a user touches a link|2.5.2||

## HTML

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Use WAVE on each page to help check for missing markup, poor contrast and any other "red flag" issues. (Best via a Chrome extension on an off-network laptop).|Items without alt text. Low contrast.|1.1.1||
|2|Check that page (and frame) titles match their headings.|Same `<title>` on every page.|1.1.1<br>2.4.1<br>2.4.2||
|3|Check that headings and lists are correctly marked up, for example as `<ul>` or `<ol>`|Use of `<b>` for headings instead of `<h1>/<h2>`. Lists not correctly formatted.|1.3.1||
|4|Sample check pages for the HTML language (for example, `<html lang="cy">` for Welsh pages). If more than one language is used on a page, check subsection headings.|No `lang` attribute.|3.1.1<br>3.1.2||
|5|Copy and paste the HTML source for the most complicated page(s) into [an HTML validator](http://validator.w3.org), and check for major errors.|Lots of errors suggest that developers are not following code standards|4.1.1||
|6|The service supports autofill for common fields, such as first name, postal code or birthday.|Autofill misses out common fields|1.3.5||

## Screen reader

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Check that the screen reader identifies forms, headings, links and tables correctly and consistently. The screen reader names must contain the text shown on screen.|Links shown as forms, or vice versa. Illogical `<h1>-<h3>` structure. Inconsistencies between the visual and screen reader names.|1.1.1<br>1.3.1<br>2.4.6<br>2.5.3<br>4.1.2||
|2|Spot check pages for unnecessary access keys, detected via the screen reader or searching the HTML for `accesskey`. Where used, ensure that they only work when that item is in focus, and can be deactivated or re-mapped.|Access keys (such as "Alt+H to go home") with no user need|2.1.1<br>2.1.4||
|3|Check that multiple links with the same text (such as "Edit") are read differently by a screen reader. HTML that can be used to do this is `<span class="visually-hidden">`|Multiple "click here", "edit" or "register" links which can't be distinguished.|2.4.4<br>2.4.6||

## Timeouts

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Look for any timeouts under 20 hours. The user must be warned that a timeout exists, and able to extend it.|No timeout warnings. No option to extend timeout. Unfriendly message after timeout.|2.2.1||
|2|Check that any automatically updating content can be paused.|Unnecessary flashing, moving or changing text.|2.2.2||

## Finally

Once you have eliminated major accessibility issues by testing in these ways, the best insight you can get is by doing user testing with people who use assistive technologies.
