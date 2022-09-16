local comment_ok, comment = pcall(require, 'Comment')
if not comment_ok then
    vim.api.nvim_err_writeln('Failed to load comment')
    return
end

comment.setup()
