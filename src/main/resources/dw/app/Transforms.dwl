/*
 * This normalizes a string for LLM prompts
 */
fun clean(s: String): String =
	trim(lower(s))