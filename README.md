# Beinex AI Agent Workflow Builder (Ephrem)

An Enterprise Human-in-the-Loop AI Agent Management & Workflow Orchestration Platform designed for UAE public sector and regulated enterprises.

Based on **Beinex AI Agent Workflow Builder PRD v1.0**.

---

## 🌟 Key Features

1. **Two Ways to Build (PRD 1.3, 7.1, 7.2, 9.2)**:
   - **Describe it**: Natural language prompt-based agent and workflow creation in Arabic and English.
   - **Build it**: Intuitive visual drag-and-drop canvas with 7 core building bricks (Trigger, Agent, Tool/Connector, Logic/Fork, Human Gate, Council, Sub-workflow).
   - Both modes read and write the exact same declarative DAG JSON definition.

2. **First-Class Beinex Noah Models (PRD 7.6)**:
   - `noah-verify` (v2.4): Specialized for verification, document extraction, invoice PO matching, and compliance checking (99.4% benchmark precision on UAE tax invoices).
   - `noah-decide` (v2.1): Specialized for recommendations, risk scoring, routing, and multi-agent council synthesis.
   - UAE Sovereign National Cloud and private air-gapped deployment capable.

3. **Golden Rule Human-in-the-Loop Governance (PRD 5.2, 7.8)**:
   - Zero unauthorized writes: Any step that writes to external systems (ERP, SAP General Ledger, outbound email) must be preceded by an authorized human approval gate (e.g. Fatima Al Mansoori).
   - Automatic routing for amounts over AED 50,000 or detected discrepancies.

4. **Multi-Agent Councils (PRD 7.9)**:
   - Multi-agent committee deliberation (e.g., Procurement Council: Contract Review + Policy Q&A + Invoice Checker + Supplier Risk) debating edge cases with source citations and producing a single synthesized Council View.

5. **Client Interoperability (PRD 7.10)**:
   - Two-way compatibility with Microsoft Copilot Studio, n8n, Model Context Protocol (MCP), and OpenAPI services.

6. **Interactive Runs & Immutable Audit Logs (PRD 7.12, 7.14)**:
   - Execution trace drawer with step-by-step latency, token spend, model calls, and SHA-256 cryptographic audit seal.

7. **Kiosk & Showcase Mode (PRD 7.16)**:
   - Touch-optimized 48px interface tailored for Beinex HQ Executive Experience Centres with instant scenario simulation.

8. **Ephrem Pulse · Governed Proactivity & Shared Watchers**:
   - **Shared Watcher Architecture**: Configure watchers in **Agent Builder** and **Workflow Builder**, monitor findings read-only in **Ephrem Pulse**, and govern centrally with emergency admin pause.
   - **Role-Based Briefings & Alert Controls**: Tailored executive briefings by persona (Finance Ops, Finance Manager, Security, Internal Audit) with daily alert caps, quiet hours (`19:00–07:00`), and Microsoft Teams / Outlook delivery channels.
   - **Prepared Approval Dossiers & Backup Escalation**: One-place approval summaries (supporting documents, possible risks, AI confidence, backup approver escalation, and reminders) across Pulse and Human Approval Gates.
   - **Evidence-Based Autonomy & Builder Assistant**: Historical 20-case replay, auto-generated sandbox test suites, live rule/conflict checking, and rolling model quality drift monitoring.
   - **Workflow Intelligence & Safe Failure Recovery**: Context-aware next-step suggestions, repeated manual work detection, step retry/cost optimization, and governed incident recovery (`#INC-210`).

---

## 🚀 Running the Prototype Locally

Simply open `index 2.html` in any modern browser, or run a local static server:

```bash
# Start local development server
npx serve .
# or
node -e "const http=require('http'), fs=require('fs'), path=require('path'); const server=http.createServer((req,res)=>{ let f=path.join(__dirname, req.url==='/'?'index 2.html':decodeURIComponent(req.url.split('?')[0])); if(fs.existsSync(f)){ res.writeHead(200); fs.createReadStream(f).pipe(res); } else { res.writeHead(404); res.end('Not found'); } }).listen(3000, ()=>console.log('Running on http://localhost:3000'));"
```

---

## 📁 Repository Structure

- `index 2.html`: Complete, fully functional governed AI Agent & Workflow Builder prototype.
- `Ephrem.html`: Original baseline prototype.
- `Beinex_AI_Agent_Workflow_Builder_PRD (1).docx`: Complete enterprise PRD specifications.
- `README.md`: Project documentation.

---

&copy; 2026 Beinex Solutions. All rights reserved.
