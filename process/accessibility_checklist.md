# Accessibility checklist

[Accessibility](accessibility.md) is about more than checklists; it's about including everyone who needs to use your service. However, a checklist like the one below will give you an objective idea whether your service meets the minimum standard.

The following tests are a simplified version of the [WebAIM checklist](https://webaim.org/standards/wcag/checklist). They map to the mandatory [Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/glance/) version 2.1 at levels A and AA.

## Navigation

|Number|Test|Common failures|Guideline|Status|
|---|---|---|---|---|
|1|Zoom the browser to 200% and navigate through the service.|Content overlaps on zoom or exceeds screen width|[Resize](https://www.w3.org/WAI/WCAG21/Understanding/resize-text.html)||
|2|Navigate using only a keyboard. When tabbing, check that it's obvious where the focus lies and that it's impossible to get trapped.|Being unable to tab to buttons or links.|[Keyboard](https://www.w3.org/WAI/WCAG21/Understanding/keyboard.html)<br>[No trap](https://www.w3.org/WAI/WCAG21/Understanding/no-keyboard-trap.html)<br>[Focus order](https://www.w3.org/WAI/WCAG21/Understanding/focus-order.html)<br>[Focus visible](https://www.w3.org/WAI/WCAG21/Understanding/focus-visible.html)||
|3|Check that there are no disorienting changes (such as popups or a loss of keyboard focus) without prior warning. Where hover-over content appears, ensure that the content itself can be hovered over or dismissed, and remains visible until dismissed or no longer relevant.|A delete button, which, upon activation, shows an "Are you sure?" popup. A hover-over explanation which disappears when you zoom out to view it.|[Hover](https://www.w3.org/WAI/WCAG21/Understanding/content-on-hover-or-focus.html)<br>[On focus](https://www.w3.org/WAI/WCAG21/Understanding/on-focus.html)<br>[On input](https://www.w3.org/WAI/WCAG21/Understanding/on-input.html)||
|4|Spot check pages for a "Skip to main content" link at the top (use Shift+Tab), and access it. If there is no link, check that the headings are in a logical structure.|No 'skip' link, or link doesn't work properly|[Bypass](https://www.w3.org/WAI/WCAG21/Understanding/bypass-blocks.html)||
|5|Check that it is easy to move between sections of the service. A short journey may only require back links and continue buttons. A longer journey may require step-by-step navigation.|Long, drawn out user journey with no easy way to go back and correct errors.|[Multiple ways](https://www.w3.org/WAI/WCAG21/Understanding/multiple-ways.html)||

## Visual and audio

|Number|Test|Common failures|Guideline|Status|
|---|---|---|---|---|
|1|Check colour and contrast throughout. Ensure colour is never the only means of conveying information, and there are no areas of low contrast on the screen. Use WAVE, or another contrast checker if unsure.|Traffic lights to determine status. Red formatting, with no extra text, to highlight errors. Icons and notifications have insufficient contrast.|[Colour](https://www.w3.org/WAI/WCAG21/Understanding/use-of-color.html)<br>[Text contrast](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)<br>[Non text contrast](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html)||
|2|Ensure no essential information is conveyed solely through images, sound, video, shapes, or screen location.|A need to use a visual or audio element (such as a map, captcha, beep or video) in order to progress.|[Audio/video only](https://www.w3.org/WAI/WCAG21/Understanding/audio-only-and-video-only-prerecorded.html)<br>[Prerecorded captions](https://www.w3.org/WAI/WCAG21/Understanding/captions-prerecorded.html)<br>[Media alternative](https://www.w3.org/WAI/WCAG21/Understanding/audio-description-or-media-alternative-prerecorded.html)<br>[Live captions](https://www.w3.org/WAI/WCAG21/Understanding/captions-live.html)<br>[Audio description](https://www.w3.org/WAI/WCAG21/Understanding/audio-description-prerecorded.html)<br>[Sensory](https://www.w3.org/WAI/WCAG21/Understanding/sensory-characteristics.html)<br>[Audio control](https://www.w3.org/WAI/WCAG21/Understanding/audio-control.html)<br>[Images of text](https://www.w3.org/WAI/WCAG21/Understanding/images-of-text.html)||

## Content

|Number|Test|Common failures|Guideline|Status|
|---|---|---|---|---|
|1|Check for plain English, with relevant information coming first, consistent use of terms, and no unnecessary or duplicated text.|Essential information appearing after a Start or Continue button. Unnecessary jargon or abbreviations.|[Meaningful sequence](https://www.w3.org/WAI/WCAG21/Understanding/meaningful-sequence.html)<br>[Consistent navigation](https://www.w3.org/WAI/WCAG21/Understanding/consistent-navigation.html)<br>[Consistent identification](https://www.w3.org/WAI/WCAG21/Understanding/consistent-identification.html)||
|2|Check for guidance text within form labels.|User needs to create a password but isn't told beforehand that it needs to contain a digit.|[Instructions](https://www.w3.org/WAI/WCAG21/Understanding/labels-or-instructions.html)||
|3|Check that text spacing can be reasonably adjusted.|Changing line spacing to 1.5x line height causes text to be hidden.|[Text spacing](https://www.w3.org/WAI/WCAG21/Understanding/text-spacing.html)||

## Mobile

|Number|Test|Common failures|Guideline|Status|
|---|---|---|---|---|
|1|Check pages in portrait and landscape modes. All content should be visible, the right way up, and two-dimensional scrolling should not be required.|Horizontal and vertical scrollbars need to be used. Content doesn't rotate with the mobile.|[Orientation](https://www.w3.org/WAI/WCAG21/Understanding/orientation.html)<br>[Reflow](https://www.w3.org/WAI/WCAG21/Understanding/reflow.html)||
|2|Check that you can navigate the service without relying on gestures, such as dragging, pinching or shaking a device, and that these gestures can be disabled.|A map which can only be zoomed using a pinch gesture. A "shake to undo" function that can't be turned off.|[Gestures](https://www.w3.org/WAI/WCAG21/Understanding/pointer-gestures.html)<br>[Motion](https://www.w3.org/WAI/WCAG21/Understanding/motion-actuation.html)||

## Status

|Number|Test|Common failures|Guideline|Status|
|---|---|---|---|---|
|1|Leave mandatory fields blank, or enter incorrect values. Ensure that it's clear what the error is, what the user needs to do to fix it, and that there is a link to the error.|Popup errors, or fields turning red with no additional prompt.|[Error identification](https://www.w3.org/WAI/WCAG21/Understanding/error-identification.html)<br>[Error suggestion](https://www.w3.org/WAI/WCAG21/Understanding/error-suggestion.html)||
|2|Where a user submits financial, legal or test information, ensure they have a chance to check and amend it before submitting it.|No ability to correct errors|[Error prevention](https://www.w3.org/WAI/WCAG21/Understanding/error-prevention-legal-financial-data.html)||
|3|Where the status of an action (such as a payment) changes, ensure the user receives confirmation of this without interrupting their flow.|No confirmation provided back to user.|[Status messages](https://www.w3.org/WAI/WCAG21/Understanding/status-messages.html)||
|4|Ensure that actions don't take place as soon as the pointer is pressed down on a button, and can be easily cancelled by moving the pointer away.|A pop-up window opens as soon as a user touches a link|[Pointer cancellation](https://www.w3.org/WAI/WCAG21/Understanding/pointer-cancellation.html)||

## HTML

|Number|Test|Common failures|Guideline|Status|
|---|---|---|---|---|
|1|Use WAVE on each page to help check for missing markup, poor contrast and any other "red flag" issues. (Best via a Chrome extension on an off-network laptop).|Items without alt text. Low contrast.|[Non-text content](https://www.w3.org/WAI/WCAG21/Understanding/non-text-content.html)||
|2|Check that page (and frame) titles match their headings.|Same `<title>` on every page.|[Page title](https://www.w3.org/WAI/WCAG21/Understanding/page-titled.html)||
|3|Check that headings and lists are correctly marked up, for example as `<ul>` or `<ol>`|Use of `<b>` for headings instead of `<h1>/<h2>`. Lists not correctly formatted.|[Information and relationships](https://www.w3.org/WAI/WCAG21/Understanding/info-and-relationships.html)||
|4|Sample check pages for the HTML language (for example, `<html lang="cy">` for Welsh pages). If more than one language is used on a page, check subsection headings.|No `lang` attribute.|[Page language](https://www.w3.org/WAI/WCAG21/Understanding/language-of-page.html)<br>[Section language](https://www.w3.org/WAI/WCAG21/Understanding/language-of-parts.html)||
|5|Copy and paste the HTML source for the most complicated page(s) into [an HTML validator](http://validator.w3.org), and check for major errors.|Lots of errors suggest that developers are not following code standards|[HTML parsing](https://www.w3.org/WAI/WCAG21/Understanding/parsing.html)||
|6|The service supports autofill for common fields, such as first name, postcode or birthday.|Autofill misses out common fields|[Input purpose](https://www.w3.org/WAI/WCAG21/Understanding/identify-input-purpose.html)||

## Screen reader

|Number|Test|Common failures|Guideline|Status|
|---|---|---|---|---|
|1|Check that the screen reader identifies forms, headings, links and tables correctly and consistently. The screen reader names must contain the text shown on screen.|Links shown as forms, or vice versa. Illogical `<h1>-<h3>` structure. Inconsistencies between the visual and screen reader names.|[Information and relationships](https://www.w3.org/WAI/WCAG21/Understanding/info-and-relationships.html)<br>[Headings and labels](https://www.w3.org/WAI/WCAG21/Understanding/headings-and-labels.html)<br>[Label in name](https://www.w3.org/WAI/WCAG21/Understanding/label-in-name.html)<br>[Name, role and value](https://www.w3.org/WAI/WCAG21/Understanding/name-role-value.html)||
|2|Spot check pages for unnecessary access keys, detected via the screen reader or searching the HTML for `accesskey`. Where used, ensure that they only work when that item is in focus, and can be deactivated or re-mapped.|Access keys (such as "Alt+H to go home") with no user need|[Shortcuts](https://www.w3.org/WAI/WCAG21/Understanding/character-key-shortcuts.html)||
|3|Check that multiple links with the same text (such as "Edit") can be uniquely understood out of context a screen reader. HTML that can be used to do this is `<span class="visually-hidden">`|Multiple "click here", "edit" or "register" links which can't be distinguished.|[Link context](https://www.w3.org/WAI/WCAG21/Understanding/link-purpose-in-context.html)<br>[Headings and labels](https://www.w3.org/WAI/WCAG21/Understanding/headings-and-labels.html)||

## Timeouts and motion

|Number|Test|Common failures|Guideline|Status|
|---|---|---|---|---|
|1|Look for any timeouts under 20 hours. The user must be warned that a timeout exists, and able to extend it.|No timeout warnings. No option to extend timeout. Unfriendly message after timeout.|[Timeouts](https://www.w3.org/WAI/WCAG21/Understanding/timing-adjustable.html)||
|2|Check that any automatically updating content can be paused and that there is no rapidly flashing content.|Unnecessary flashing, moving or changing text.|[Pause](https://www.w3.org/WAI/WCAG21/Understanding/pause-stop-hide.html)<br>[Flashing](https://www.w3.org/WAI/WCAG21/Understanding/three-flashes-or-below-threshold.html)||
