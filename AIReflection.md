# AI Reflection — Assignment 8 (FutHub iOS)

## 1. How Did You Use AI in This Assignment?

- I mostly kept the AI-generated code as-is, following the steps one at a time and confirming each piece worked before moving to the next feature. I like working this way because it keeps me from getting lost when a lot of new code is introduced at once.
- Example: for the TabView feature, I had to change TeamListView from using its own @State array to a @Binding, so it could share the same teams data with the new StatsView tab. Understanding why that change was needed (so both tabs stay in sync when I favorite a team) helped me actually get what @Binding is for, not just copy it.
- Example: earlier in Assignment 7, I got confused about where exactly to wrap the row content in a Button for the .sheet feature. I asked for the full file instead of just the snippet, which helped me see the whole structure and understand where things fit together.
- New concept I had to look into more: Swift Charts. I hadn't used it in class before, so I had to spend a bit more time understanding how BarMark works and why my first chart looked wrong (the single bar was stretching to fill the whole width) before fixing it with a fixed width value.

## 2. How Did You Understand, Verify, and Adapt the Code?

- I verified everything by running it in the simulator and checking that it looked and worked the way I expected — tapping through search, swipe actions, the context menu, switching tabs, and toggling settings.
- Key change #1: I fixed the Swift Charts bar width issue after seeing the bar look wrong with only one favorite team. Once I understood the bars were auto-stretching because there wasn't enough categories on the x-axis, fixing it made sense instead of just being a random tweak.
- Key change #2: I decided to rename the project iOSApp5 instead of iOSApp4 to avoid a conflict with an earlier repo, and kept that naming consistent across both assignments so my GitHub history stays organized.

## 3. What Did You Learn or Get Better At Through This Work?

- I feel like I leveled up in understanding state sharing between views in SwiftUI — specifically how @State vs @Binding work together when multiple screens need access to the same data (like teams needing to update in both the Teams list and the Stats chart).
- What went well: the overall process was smooth. Building features one at a time and testing each in the simulator before moving on made it easy to catch issues early instead of debugging a big pile of code at the end.
- What didn't go as smoothly: Swift Charts took a bit more trial and error than the other features since it was new to me, but once I saw the fix it made sense.
