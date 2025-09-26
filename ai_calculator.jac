import re
import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Convert natural language math into a Python expression."""
def ai_parse_natural_language(input_str: str) -> str by llm();

walker Calculator:
    has input_str: str
    has result: float

    can parse_expression():
        try:
            self.result = eval(self.input_str)
            return True
        except:
            return False

    can ai_parse():
        # LLM-powered fallback for complex/natural language queries
        parsed_expr = ai_parse_natural_language(self.input_str)
        # Remove unsafe characters for eval
        parsed_expr = re.sub(r'[^0-9\+\-\*/\. ]', '', parsed_expr)
        try:
            self.result = eval(parsed_expr)
            return True
        except:
            return False

    can run():
        if self.parse_expression():
            print(f"Result: {self.result}")
        elif self.ai_parse():
            print(f"AI Parsed Result: {self.result}")
        else:
            print("Sorry, I couldn't understand your input.")

entry {
    print("=== AI-Enhanced Jaclang Calculator ===")
    print("Type a math expression (e.g., 5+3) or a question (e.g., What is 5 plus 3?)")
    input_str = input("Enter calculation: ")
    Calculator(input_str=input_str).run()