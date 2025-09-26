# AI-Enhanced Jaclang Calculator

This calculator can solve both normal math expressions (like `5+3`) and natural language questions (like "What is 5 plus 3?") by using byLLM with Gemini.

## How to Run

1. **Install Jaclang and byllm**  
   Make sure you have [Jaclang](https://jac-lang.com/) and `byllm` installed.

   ```sh
   pip install jaclang byllm
   ```

2. **Save the code**  
   Save the calculator to a file, e.g., `ai_calculator.jac`.

3. **Run the calculator**

   ```sh
   jac ai_calculator.jac
   ```

4. **Follow the prompt**  
   Enter a calculation (either as a math expression or in plain English).

---

**Example inputs:**
- `5 * (2 + 3)`
- `What is ten divided by two?`
- `Add 3 and 7`

---

**Note:**  
- You need internet access for the LLM feature.
- The LLM model used is Gemini 2.0 Flash by default.