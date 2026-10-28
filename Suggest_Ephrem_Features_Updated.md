# Suggested Features for the Ephrem AI Platform

## Main design principle

**Configure in the builders, monitor in Pulse, and govern through central controls.**

Agent Builder and Workflow Builder are where users create and configure watchers. Pulse is the central place to view what those watchers detect and the suggestions they generate. Authorised administrators manage platform-wide safety controls in a separate administration or governance area.

## 1. Simple feature comparison table

| Feature | Agent Builder | Workflow Builder | Pulse |
|---|---|---|---|
| Create a watcher | Yes | Yes | No |
| Edit watcher settings | Yes | Yes | No |
| Choose what to monitor | Yes | Yes | No |
| Set conditions and schedules | Yes | Yes | No |
| Connect a watcher to an agent or workflow | Yes | Yes | No |
| View issues and suggestions detected by watchers | View results linked to the agent | View results linked to the workflow | Yes, central view |
| View why a suggestion appeared | Yes | Yes | Yes |
| View watcher status and history | Yes | Yes | Yes, read-only view |
| Open the relevant builder to make changes | Already in the builder | Already in the builder | Yes, through a link |
| Pause all watchers in an emergency | No, unless an authorised admin link is provided | No, unless an authorised admin link is provided | No, use central administration or governance controls |

## 2. Pulse: Make the daily briefing more useful

- **Show watcher findings and suggestions:** Display what was detected, why it matters, when it happened, and which watcher or agent detected it.
- **Link findings to the right place:** Show the related agent or workflow, severity, current status, and a link such as **View in Agent Builder** or **View in Workflow Builder**.
- **Keep Pulse read-only for watcher configuration:** Remove Create Watcher, Edit Watcher, and watcher setup options from Pulse. Users should go to the relevant builder to change a watcher's conditions or schedule.
- **Learn from user feedback:** Let users mark suggestions as useful or not useful, or choose “Show me less of this.” Use this feedback to improve future suggestion ranking.
- **Control the number of alerts:** Limit how many suggestions a user receives each day, show important alerts first, and allow quiet hours to avoid unnecessary notifications.
- **Provide role-based briefings:** Show information relevant to each person's responsibilities. For example, Fatima sees pending approvals, Omar sees agent failures and access changes, and Faisal sees audit and compliance issues.
- **Support multiple delivery channels:** Allow important briefings and approval requests to reach users through Teams, Outlook, or email, with suitable security controls.
- **Support ongoing tasks:** Let users give an agent a long-term goal. For example, “Keep track of supplier licence expiry dates and alert me before they expire.”
- **Prepare approval summaries:** Before asking someone to approve an action, provide relevant documents, supporting information, possible risks, and a suggested decision in one place.
- **Remind and escalate pending approvals:** If an approval is delayed, send a reminder. If it remains pending, notify the assigned backup approver or manager.

### Example

A contract expiry watcher created in Agent Builder detects that a supplier contract will expire in 30 days. Pulse displays the alert, explains why it appeared, and links to the relevant agent. The user opens Pulse to understand the issue and goes to Agent Builder if the monitoring conditions need to change.

## 3. Agent Builder: Make agents easier to build and manage

- **Builder assistant:** Add an assistant that checks an agent while it is being built. It should point out missing safety rules, write tools that could change real systems without approval, and settings that conflict with each other.
- **Automatically create test cases:** Generate sample questions and situations to test the agent. For example, an invoice-checking agent should be tested with duplicate invoices, missing details, and incorrect amounts.
- **Test before increasing independence:** Test the agent using previous examples and show how many cases it handled correctly and how many needed human intervention.
- **Suggest greater independence based on performance:** If an agent performs consistently well, suggest that it could handle more tasks automatically. Required human approvals must remain in place.
- **Monitor model quality:** Track the accuracy of the Noah model and alert the team if its performance drops below the expected level.
- **Add a Watchers section to the Agent Card:** Place it below the Proactivity setting. Show watchers linked to the agent and provide an **Add Watcher** option. Users can create, configure, edit, test, and enable watchers here.
- **Suggest watchers based on agent type:** Offer one-click suggestions for common monitoring tasks:
  - Invoice Checker: detect duplicate invoices and monitor incoming invoices.
  - Contract Review: alert when a contract expires within 60 days.
  - Supplier Risk: monitor supplier licence expiry and relevant sanctions updates.
  - Leave Requests: alert when an employee's leave balance is low.
- **Create watchers through chat:** Let users describe what they need in plain language. For example, “Monitor the Finance mailbox for duplicate invoices.” The builder assistant should create the watcher configuration for the user to review.
- **Test watchers before enabling them:** Check available records from the last 30 days and show how often a watcher would have triggered. For example, “This watcher would have triggered four times, and three alerts appear useful.”
- **Include watcher changes in version history and approvals:** Record new and changed watcher settings in the agent's version history and send them through the required approval process before activation.

## 4. Workflow Builder: Make workflows smarter and easier to manage

- **Suggest the next workflow step:** Show the next likely step as a suggestion users can add with one click. For example, suggest a human approval step before updating an external system.
- **Identify repeated manual work:** Detect cases where employees repeatedly handle the same problem manually. Suggest an agent or workflow to automate that task.
- **Find delays and unnecessary costs:** Identify steps that take too long, fail repeatedly, or consume too many resources. Suggest practical improvements, such as reducing unnecessary retries.
- **Recover from failures safely:** Retry a failed step when appropriate. If the problem continues, raise an incident and prepare a suggested fix for human approval.
- **Support event-based triggers:** Let workflows start when an event happens, such as a contract nearing expiry, a supplier licence approaching renewal, or a financial amount exceeding a limit.
- **Show upcoming compliance deadlines:** Alert users about important dates, such as VAT filing deadlines, licence renewals, and scheduled audits.
- **Add Watcher as a workflow trigger:** Allow a workflow to start when a connected watcher detects a matching event, while respecting the workflow's autonomy and safety settings.
- **Add a Watch tab to each workflow step:** Let users configure monitoring for individual steps:
  - Human approval step: alert when approval has been waiting for more than four hours and escalate according to the configured rules.
  - Agent step: alert when the agent's confidence drops below the set limit.
  - Tool step: alert when the same tool repeatedly fails.
- **Add a Monitor This Flow option:** Place it near the workflow's autonomy setting. Let users configure monitoring for workflow failures, unusual costs, approval delays, and the percentage of tasks completed without human intervention.
- **Create watcher configurations through the workflow assistant:** For example, “Start this workflow whenever an invoice above 50,000 arrives.” The assistant should configure the watcher and workflow trigger together for review.
- **Show which watcher triggered a workflow:** Display the watcher's name or link in the workflow run details, so users can understand why the workflow started.
- **Show workflow origins clearly:** If a workflow is launched by a watcher, show a label such as “Started by Contract Expiry Watcher.” Allow users to open the watcher in the relevant builder.

## 5. Watchers: Shared behaviour across the platform

### Current problems

- Watchers are currently predefined demo data in Pulse.
- Users can enable or pause them on the Pulse tab, but cannot fully create and configure them from the builders.
- The Agent Card only displays a message saying that no watcher is linked.
- The Workflow Builder has no direct way to connect workflows to watchers.

### Recommended changes

- **Use one shared watcher record:** A watcher configured in Agent Builder or Workflow Builder should appear consistently across the platform. Avoid separate copies of the same watcher.
- **Keep configuration in the builders:** Agent Builder handles watchers linked to agents. Workflow Builder handles watchers that start or monitor workflows and individual steps. Pulse does not create or edit watcher settings.
- **Show watcher results in Pulse:** Pulse should display findings, explanations, timestamps, severity, status, and links to the related agent or workflow.
- **Make each watcher easy to understand:** A watcher should define what it monitors, the condition it checks, when it checks, what happens when it finds something, and which agent or workflow it belongs to.
- **Use only permitted data sources:** A watcher should monitor only data the connected agent or workflow is authorised to read.
- **Prevent direct changes to real systems:** Watchers should detect issues and report them. Actions that change data or affect a real system must follow the required human approval process.
- **Test before activation:** Show how often a watcher would have triggered on historical data and help users spot unnecessary alerts before they enable it.
- **Maintain a complete history:** Record who created, changed, enabled, paused, or deleted a watcher. Include relevant changes in version history and the audit log.
- **Limit alerts per watcher:** Set a maximum number of notifications per day so one watcher cannot flood the Pulse feed.
- **Keep emergency controls central:** Provide authorised administrators with a global option to pause all watchers in the administration or governance area, rather than adding configuration controls to Pulse.
- **Use clear links between areas:** Pulse should link to the correct builder when a user needs to change a watcher. The builders should show connected findings and workflow runs where relevant.

## 6. Suggested implementation order

1. **Create the shared watcher model and builder controls.** Let users create, configure, edit, and link watchers from Agent Builder and Workflow Builder.
2. **Make Pulse a monitoring-only view.** Remove watcher creation and editing controls. Show findings, explanations, status, history, and links back to the builders.
3. **Connect watchers to workflows.** Add Watcher as a workflow trigger and add the Monitor This Flow option.
4. **Add common watcher suggestions and dry-run testing.** Help users configure useful watchers quickly and see whether they generate too many alerts.
5. **Add step-level monitoring.** Track delayed approvals, low agent confidence, and repeated tool failures.
6. **Introduce advanced improvements.** Add automatic test generation, performance-based autonomy suggestions, workflow optimisation, and detection of repeated manual tasks.
7. **Complete governance controls.** Add versioning, approvals, audit history, alert caps, and a global emergency pause for authorised administrators.

## 7. Three features to prioritise for the presentation

- **Evidence-based autonomy:** Test agents on previous cases and show their accuracy before suggesting that they should handle more tasks independently.
- **Faster approvals:** Prepare relevant evidence and recommendations in one approval summary, then remind or escalate when approvals are delayed.
- **Automation of repeated manual work:** Identify problems employees keep solving manually and suggest an agent or workflow to handle them.

## Main message

**Make Ephrem proactive but safe.** The platform should detect issues early, make useful suggestions, help users build workflows, and reduce repetitive work. It should also enforce access restrictions, require human approval for sensitive actions, and keep a clear record of what happened and who approved it.
