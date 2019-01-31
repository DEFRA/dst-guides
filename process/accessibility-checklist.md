# Accessibility checklist

[Accessibility](accessibility.md) is about more than checklists. However, a checklist like the one below will give you an objective idea whether your service meets the minimum standard.

The following tests are a simplified version of the [WebAIM checklist](https://webaim.org/standards/wcag/checklist). They refer to the mandatory [Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/glance/) at level A and AA.

## Navigation

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Zoom the browser to 200% and navigate through the service.|Content overlaps on zoom or exceeds screen width|[1.4.4](https://www.w3.org/WAI/WCAG21/Understanding/resize-text.html)||
|2|Navigate using only a keyboard. When tabbing, check that it's obvious where the focus lies and that it's impossible to get trapped.|Being unable to tab to buttons or links.|[2.1.1](https://www.w3.org/WAI/WCAG21/Understanding/keyboard.html)<br>[2.1.2](https://www.w3.org/WAI/WCAG21/Understanding/no-keyboard-trap.html)<br>[2.4.3](https://www.w3.org/WAI/WCAG21/Understanding/focus-order.html)<br>[2.4.7](https://www.w3.org/WAI/WCAG21/Understanding/focus-visible.html)||
|3|Check that there are no disorienting changes (such as popups or a loss of keyboard focus) without prior warning. Where hover-over content appears, ensure that the content itself can be hovered over or dismissed, and remains visible until dismissed or no longer relevant.|A delete button, which, upon activation, shows an "Are you sure?" popup. A hover-over explanation which disappears when you zoom out to view it.|[1.4.13](https://www.w3.org/WAI/WCAG21/Understanding/content-on-hover-or-focus.html)<br>[3.2.1](https://www.w3.org/WAI/WCAG21/Understanding/on-focus.html)<br>[3.2.2](https://www.w3.org/WAI/WCAG21/Understanding/on-input.html)||
|4|Spot check pages for a "Skip to main content" link at the top (use Shift+Tab), and access it. If there is no link, check that the headings are in a logical structure.|No 'skip' link, or link doesn't work properly|[2.4.1](https://www.w3.org/WAI/WCAG21/Understanding/bypass-blocks.html)||
|5|Check that it is easy to move between sections of the service. A short journey may only require back links and continue buttons. A longer journey may require step-by-step navigation.|Long, drawn out user journey with no easy way to go back and correct errors.|[2.4.5](https://www.w3.org/WAI/WCAG21/Understanding/multiple-ways.html)||

## Visual and audio

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Check colour and contrast throughout. Ensure colour is never the only means of conveying information, and there are no areas of low contrast on the screen. Use WAVE, or another contrast checker if unsure.|Traffic lights to determine status. Red formatting, with no extra text, to highlight errors. Icons and notifications have insufficient contrast.|[1.4.1](https://www.w3.org/WAI/WCAG21/Understanding/use-of-color.html)<br>[1.4.3](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)<br>[1.4.11](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html)||
|2|Ensure no essential information is conveyed solely through images, sound, video, shapes, or screen location.|A need to use a visual or audio element (such as a map, captcha, beep or video) in order to progress.|[1.2.1](https://www.w3.org/WAI/WCAG21/Understanding/audio-only-and-video-only-prerecorded.html)<br>[1.2.2](https://www.w3.org/WAI/WCAG21/Understanding/captions-prerecorded.html)<br>[1.2.3](https://www.w3.org/WAI/WCAG21/Understanding/audio-description-or-media-alternative-prerecorded.html)<br>[1.2.4](https://www.w3.org/WAI/WCAG21/Understanding/captions-live.html)<br>[1.2.5](https://www.w3.org/WAI/WCAG21/Understanding/audio-description-prerecorded.html)<br>[1.3.3](https://www.w3.org/WAI/WCAG21/Understanding/sensory-characteristics.html)<br>[1.4.2](https://www.w3.org/WAI/WCAG21/Understanding/audio-control.html)<br>[1.4.5](https://www.w3.org/WAI/WCAG21/Understanding/images-of-text.html)||

## Content

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Check for plain English, with relevant information coming first, consistent use of terms, and no unnecessary or duplicated text.|Essential information appearing after a Start or Continue button. Unnecessary jargon or abbreviations.|[1.1.1](https://www.w3.org/WAI/WCAG21/Understanding/non-text-content.html)<br>[1.3.2](https://www.w3.org/WAI/WCAG21/Understanding/meaningful-sequence.html)<br>[3.2.3](https://www.w3.org/WAI/WCAG21/Understanding/consistent-navigation.html)<br>[3.2.4](https://www.w3.org/WAI/WCAG21/Understanding/consistent-identification.html)||
|2|Check for guidance text within form labels.|User needs to create a password but isn't told beforehand that it needs to contain a digit.|[3.3.1](https://www.w3.org/WAI/WCAG21/Understanding/error-identification.html)<br>[3.3.2](https://www.w3.org/WAI/WCAG21/Understanding/labels-or-instructions.html)||
|3|Check that text spacing can be reasonably adjusted.|Changing line spacing to 1.5x line height causes text to be hidden.|[1.4.12](https://www.w3.org/WAI/WCAG21/Understanding/text-spacing.html)||

## Mobile

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Check pages in portrait and landscape modes. All content should be visible, the right way up, and two-dimensional scrolling should not be required.|Horizontal and vertical scrollbars need to be used.Content doesn't rotate with the mobile.|[1.3.4](https://www.w3.org/WAI/WCAG21/Understanding/orientation.html)<br>[1.4.10](https://www.w3.org/WAI/WCAG21/Understanding/reflow.html)||
|2|Check that you can navigate the service without relying on gestures, such as dragging, pinching or shaking a device, and that these gestures can be disabled.|A map which can only be zoomed using a pinch gesture. A "shake to undo" function that can't be turned off.|[2.5.1](https://www.w3.org/WAI/WCAG21/Understanding/pointer-gestures.html)<br>[2.5.4](https://www.w3.org/WAI/WCAG21/Understanding/motion-actuation.html)||

## Status

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Leave mandatory fields blank, or enter incorrect values. Ensure that it's clear what the error is, what the user needs to do to fix it, and that there is a link to the error.|Popup errors, or fields turning red with no additional prompt.|[3.3.1](https://www.w3.org/WAI/WCAG21/Understanding/error-identification.html)<br>[3.3.3](https://www.w3.org/WAI/WCAG21/Understanding/error-suggestion.html)||
|2|Where a user submits financial, legal or test information, ensure they have a chance to check and amend it before submitting it.|No ability to correct errors|[3.3.4](https://www.w3.org/WAI/WCAG21/Understanding/error-prevention-legal-financial-data.html)||
|3|Where the status of an action (such as a payment) changes, ensure the user receives confirmation of this without interrupting their flow.|No confirmation provided back to user.|[3.3.4](https://www.w3.org/WAI/WCAG21/Understanding/error-prevention-legal-financial-data.html)<br>[4.1.3](https://www.w3.org/WAI/WCAG21/Understanding/status-messages.html)||
|4|Ensure that actions don't take place as soon as the pointer is pressed down on a button, and can be easily cancelled by moving the pointer away.|A pop-up window opens as soon as a user touches a link|[2.5.2](https://www.w3.org/WAI/WCAG21/Understanding/pointer-cancellation.html)||

## HTML

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Use WAVE on each page to help check for missing markup, poor contrast and any other "red flag" issues. (Best via a Chrome extension on an off-network laptop).|Items without alt text. Low contrast.|[1.1.1](https://www.w3.org/WAI/WCAG21/Understanding/non-text-content.html)||
|2|Check that page (and frame) titles match their headings.|Same `<title>` on every page.|[1.1.1](https://www.w3.org/WAI/WCAG21/Understanding/non-text-content.html)<br>[2.4.2](https://www.w3.org/WAI/WCAG21/Understanding/page-titled.html)||
|3|Check that headings and lists are correctly marked up, for example as `<ul>` or `<ol>`|Use of `<b>` for headings instead of `<h1>/<h2>`. Lists not correctly formatted.|[1.3.1](https://www.w3.org/WAI/WCAG21/Understanding/info-and-relationships.html)||
|4|Sample check pages for the HTML language (for example, `<html lang="cy">` for Welsh pages). If more than one language is used on a page, check subsection headings.|No `lang` attribute.|[3.1.1](https://www.w3.org/WAI/WCAG21/Understanding/language-of-page.html)<br>[3.1.2](https://www.w3.org/WAI/WCAG21/Understanding/language-of-parts.html)||
|5|Copy and paste the HTML source for the most complicated page(s) into [an HTML validator](http://validator.w3.org), and check for major errors.|Lots of errors suggest that developers are not following code standards|[4.1.1](https://www.w3.org/WAI/WCAG21/Understanding/parsing.html)||
|6|The service supports autofill for common fields, such as first name, postal code or birthday.|Autofill misses out common fields|[1.3.5](https://www.w3.org/WAI/WCAG21/Understanding/identify-input-purpose.html)||

## Screen reader

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Check that the screen reader identifies forms, headings, links and tables correctly and consistently. The screen reader names must contain the text shown on screen.|Links shown as forms, or vice versa. Illogical `<h1>-<h3>` structure. Inconsistencies between the visual and screen reader names.|[1.1.1](https://www.w3.org/WAI/WCAG21/Understanding/non-text-content.html)<br>[1.3.1](https://www.w3.org/WAI/WCAG21/Understanding/info-and-relationships.html)<br>[2.4.6](https://www.w3.org/WAI/WCAG21/Understanding/headings-and-labels.html)<br>[2.5.3](https://www.w3.org/WAI/WCAG21/Understanding/label-in-name.html)<br>[4.1.2](https://www.w3.org/WAI/WCAG21/Understanding/name-role-value.html)||
|2|Spot check pages for unnecessary access keys, detected via the screen reader or searching the HTML for `accesskey`. Where used, ensure that they only work when that item is in focus, and can be deactivated or re-mapped.|Access keys (such as "Alt+H to go home") with no user need|[2.1.1](https://www.w3.org/WAI/WCAG21/Understanding/keyboard.html)<br>[2.1.4](https://www.w3.org/WAI/WCAG21/Understanding/character-key-shortcuts.html)||
|3|Check that multiple links with the same text (such as "Edit") are read differently by a screen reader. HTML that can be used to do this is `<span class="visually-hidden">`|Multiple "click here", "edit" or "register" links which can't be distinguished.|[2.4.4](https://www.w3.org/WAI/WCAG21/Understanding/link-purpose-in-context.html)<br>[2.4.6](https://www.w3.org/WAI/WCAG21/Understanding/headings-and-labels.html)||

## Timeouts and motion

|Number|Test|Common failures|WCAG|Status|
|---|---|---|---|---|
|1|Look for any timeouts under 20 hours. The user must be warned that a timeout exists, and able to extend it.|No timeout warnings. No option to extend timeout. Unfriendly message after timeout.|[2.2.1](https://www.w3.org/WAI/WCAG21/Understanding/timing-adjustable.html)||
|2|Check that any automatically updating content can be paused and that there is no rapidly flashing content.|Unnecessary flashing, moving or changing text.|[2.2.2](https://www.w3.org/WAI/WCAG21/Understanding/pause-stop-hide.html)<br>[2.3.1](https://www.w3.org/WAI/WCAG21/Understanding/three-flashes-or-below-threshold.html)||

## Finally

Once you have eliminated major accessibility issues by testing in these ways, the best insight you can get is by doing user testing with people who use assistive technologies.


1.1.1 https://www.w3.org/WAI/WCAG21/Understanding/non-text-content.html y
1.2.1 https://www.w3.org/WAI/WCAG21/Understanding/audio-only-and-video-only-prerecorded.html y
1.2.2 https://www.w3.org/WAI/WCAG21/Understanding/captions-prerecorded.html y
1.2.3 https://www.w3.org/WAI/WCAG21/Understanding/audio-description-or-media-alternative-prerecorded.html y
1.2.4 https://www.w3.org/WAI/WCAG21/Understanding/captions-live.html y
1.2.5 https://www.w3.org/WAI/WCAG21/Understanding/audio-description-prerecorded.html y
1.3.1 https://www.w3.org/WAI/WCAG21/Understanding/info-and-relationships.html y
1.3.2 https://www.w3.org/WAI/WCAG21/Understanding/meaningful-sequence.html y
1.3.3 https://www.w3.org/WAI/WCAG21/Understanding/sensory-characteristics.html y
1.3.4 https://www.w3.org/WAI/WCAG21/Understanding/orientation.html y
1.3.5 https://www.w3.org/WAI/WCAG21/Understanding/identify-input-purpose.html y
1.4.1 https://www.w3.org/WAI/WCAG21/Understanding/use-of-color.html y
1.4.2 https://www.w3.org/WAI/WCAG21/Understanding/audio-control.html y
1.4.3 https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html y
1.4.4 https://www.w3.org/WAI/WCAG21/Understanding/resize-text.html y
1.4.5 https://www.w3.org/WAI/WCAG21/Understanding/images-of-text.html y
1.4.10 https://www.w3.org/WAI/WCAG21/Understanding/reflow.html y
1.4.11 https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html y
1.4.12 https://www.w3.org/WAI/WCAG21/Understanding/text-spacing.html y
1.4.13 https://www.w3.org/WAI/WCAG21/Understanding/content-on-hover-or-focus.html y
2.1.1 https://www.w3.org/WAI/WCAG21/Understanding/keyboard.html y
2.1.2 https://www.w3.org/WAI/WCAG21/Understanding/no-keyboard-trap.html y
2.1.4 https://www.w3.org/WAI/WCAG21/Understanding/character-key-shortcuts.html y
2.2.1 https://www.w3.org/WAI/WCAG21/Understanding/timing-adjustable.html y
2.2.2 https://www.w3.org/WAI/WCAG21/Understanding/pause-stop-hide.html y
2.3.1 https://www.w3.org/WAI/WCAG21/Understanding/three-flashes-or-below-threshold.html y
2.4.1 https://www.w3.org/WAI/WCAG21/Understanding/bypass-blocks.html y
2.4.2 https://www.w3.org/WAI/WCAG21/Understanding/page-titled.html y
2.4.3 https://www.w3.org/WAI/WCAG21/Understanding/focus-order.html y
2.4.4 https://www.w3.org/WAI/WCAG21/Understanding/link-purpose-in-context.html y
2.4.5 https://www.w3.org/WAI/WCAG21/Understanding/multiple-ways.html y
2.4.6 https://www.w3.org/WAI/WCAG21/Understanding/headings-and-labels.html y
2.4.7 https://www.w3.org/WAI/WCAG21/Understanding/focus-visible.html y
2.5.1 https://www.w3.org/WAI/WCAG21/Understanding/pointer-gestures.html y
2.5.2 https://www.w3.org/WAI/WCAG21/Understanding/pointer-cancellation.html y
2.5.3 https://www.w3.org/WAI/WCAG21/Understanding/label-in-name.html y
2.5.4 https://www.w3.org/WAI/WCAG21/Understanding/motion-actuation.html y
3.1.1 https://www.w3.org/WAI/WCAG21/Understanding/language-of-page.html y
3.1.2 https://www.w3.org/WAI/WCAG21/Understanding/language-of-parts.html y
3.2.1 https://www.w3.org/WAI/WCAG21/Understanding/on-focus.html y
3.2.2 https://www.w3.org/WAI/WCAG21/Understanding/on-input.html y
3.2.3 https://www.w3.org/WAI/WCAG21/Understanding/consistent-navigation.html y
3.2.4 https://www.w3.org/WAI/WCAG21/Understanding/consistent-identification.html y
3.3.1 https://www.w3.org/WAI/WCAG21/Understanding/error-identification.html y
3.3.2 https://www.w3.org/WAI/WCAG21/Understanding/labels-or-instructions.html y
3.3.3 https://www.w3.org/WAI/WCAG21/Understanding/error-suggestion.html y
3.3.4 https://www.w3.org/WAI/WCAG21/Understanding/error-prevention-legal-financial-data.html y
4.1.1 https://www.w3.org/WAI/WCAG21/Understanding/parsing.html y
4.1.2 https://www.w3.org/WAI/WCAG21/Understanding/name-role-value.html y
4.1.3 https://www.w3.org/WAI/WCAG21/Understanding/status-messages.html y
