rel_path = Rails.application.assets_manifest.assets[Spree::PrintInvoice::Config[:logo_path]]
im = Rails.root.join("public","assets",rel_path)

if im && File.exist?(im)
  pdf.image im, vposition: :top, height: 40, scale: Spree::PrintInvoice::Config[:logo_scale]
end

pdf.grid([0,3], [1,4]).bounding_box do
  pdf.text Spree.t(printable.document_type, scope: :print_invoice), align: :right, style: :bold, size: 18
  pdf.move_down 4

  pdf.text Spree.t(:invoice_number, scope: :print_invoice, number: printable.number), align: :right
  pdf.move_down 2
  pdf.text Spree.t(:invoice_date, scope: :print_invoice, date: I18n.l(printable.date)), align: :right
end
