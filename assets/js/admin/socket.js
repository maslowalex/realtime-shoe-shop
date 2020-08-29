import { Socket } from "phoenix"

export const adminSocket = new Socket("/admin_socket", {})