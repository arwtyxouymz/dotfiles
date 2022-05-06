import { {{_input_:entity}} } from '@/domains'
import { CommandReturn } from "@/applications/types";

export interface {{_name_}} {
  execute({{_cursor_}})
}

export const {{_name_}}Token = '{{_name_}}';
