on run
  set selectedText to "{popclip text}"
  if selectedText is "" then error "No selected text found." number 700

  set dialogResult to display dialog "请输入你想补充问 ChatGPT 的问题：" default answer "" buttons {"取消", "发送"} default button "发送" cancel button "取消"
  set userQuestion to text returned of dialogResult
  set trimmedQuestion to my trimText(userQuestion)
  if trimmedQuestion is "" then error "问题不能为空。" number 701

  set finalPrompt to "【原文】" & return & selectedText & return & return & "【问题】" & return & trimmedQuestion
  set the clipboard to finalPrompt
  set encodedPrompt to my urlEncode(finalPrompt)
  set targetURL to "https://chatgpt.com/?q=" & encodedPrompt

  try
    tell application "Google Chrome"
      activate
      if (count of windows) is 0 then make new window
      tell front window
        make new tab at end of tabs with properties {URL:targetURL}
        set active tab index to (count of tabs)
      end tell
    end tell
  on error
    do shell script "/usr/bin/open " & quoted form of targetURL
  end try

  my tryAutoSendInChrome()
end run

on trimText(rawText)
  set cleaned to do shell script "/usr/bin/python3 -c " & quoted form of "import sys; print(sys.argv[1].strip())" & space & quoted form of rawText
  return cleaned
end trimText

on urlEncode(rawText)
  set encoded to do shell script "/usr/bin/python3 -c " & quoted form of "import sys, urllib.parse; print(urllib.parse.quote(sys.argv[1]))" & space & quoted form of rawText
  return encoded
end urlEncode

on tryAutoSendInChrome()
  set sent to false
  set jsCode to "(function(){var input=document.querySelector('textarea, div[contenteditable=\\'true\\']');if(!input){return 'wait:no_input';}var text='';if(typeof input.value==='string'){text=input.value;}else{text=(input.innerText||input.textContent||'');}if(!text||text.trim().length===0){return 'wait:empty';}input.focus();var btn=document.querySelector('button[data-testid=\\'send-button\\'], button[aria-label*=\\'Send\\'], button[aria-label*=\\'发送\\']');if(btn&&!btn.disabled){btn.click();return 'sent:click';}var evt={key:'Enter',code:'Enter',which:13,keyCode:13,bubbles:true,cancelable:true};input.dispatchEvent(new KeyboardEvent('keydown',evt));input.dispatchEvent(new KeyboardEvent('keypress',evt));input.dispatchEvent(new KeyboardEvent('keyup',evt));return 'sent:key';})();"

  repeat with i from 1 to 30
    delay 0.35
    try
      tell application "Google Chrome"
        activate
        set jsResult to execute front window's active tab javascript jsCode
      end tell
      if jsResult is not missing value then
        if jsResult starts with "sent:" then
          set sent to true
          exit repeat
        end if
      end if
    on error
      -- Continue polling; page may still be loading.
    end try
  end repeat

  if sent then return

  try
    tell application "System Events"
      if UI elements enabled is false then error "辅助功能权限未开启。" number 710
      tell process "Google Chrome" to set frontmost to true
      key code 36
    end tell
  on error
    display notification "已填充到 ChatGPT。若未自动发送，请手动按回车。" with title "ChatGPT Prompt"
  end try
end tryAutoSendInChrome
