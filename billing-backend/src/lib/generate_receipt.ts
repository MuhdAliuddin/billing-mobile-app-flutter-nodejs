// const configPrint = require('config');
// const fs = require('fs');
// const pdfPrinter = require('pdfmake/src/printer');
// const moment = require('moment');

// module.exports.toPdf = async (site, summary) => {
//   /**
//    * r = {
//    *  bySection:{
//    *      ['section']:{
//    *          tours:[],
//    *          reports:[]
//    *      }
//    *  }
//    *  list:[],
//    *  datetime:'',
//    *  fromTime: '00:00:00',
//    *  toTime: '23:59:59'
//    * }
//    */
//   console.log('\n============= Rendering PDF Daily ================');
//   const zoneNames = [];
//   summary.list.forEach(n => {
//     zoneNames.push(n);
//   });

//   try {
//     const fonts = {
//       Roboto: {
//         normal: `${configPrint.fontsPath}/roboto/Roboto-Regular.ttf`,
//         bold: `${configPrint.fontsPath}/roboto/Roboto-Medium.ttf`,
//         italics: `${configPrint.fontsPath}/roboto/Roboto-Italic.ttf`,
//         bolditalics: `${configPrint.fontsPath}/roboto/Roboto-MediumItalic.ttf`,
//       },
//       Calibri: {
//         normal: `${configPrint.fontsPath}/calibri-font-family/calibri-regular.ttf`,
//         bold: `${configPrint.fontsPath}/calibri-font-family/calibri-bold.ttf`,
//         italics: `${configPrint.fontsPath}/calibri-font-family/calibri-italic.ttf`,
//         bolditalics: `${configPrint.fontsPath}/calibri-font-family/calibri-bold-italic.ttf`,
//       },
//     };
//     const pageLayout = {
//       height: 792,
//       width: 612,
//       // left, top, right, bottom
//       margin: [40, 150, 40, 230],
//     };
//     const printer = new pdfPrinter(fonts);

//     const dd = {
//       pageSize: 'A4',
//       pageMargins: pageLayout.margin,

//       // header of the page
//       header: [
//         `\n`,
//         {
//           text: 'PKK 4 (BAGI KONTRAK YANG BERMULA PADA 1 JANUARI 2019 DAN SETERUSNYA) – PINDAAN JULAI 2019',
//           style: 'stRight',
//         },
//         '\n',
//         {
//           text: [
//             {
//               text: 'BORANG PENGESAHAN PELAKSANAAN RONDAAN DAN ',
//               style: 'title',
//             },
//             {
//               text: 'CLOCKING',
//               style: 'title2',
//             },
//           ],
//         },
//         {
//           text: 'PERKHIDMATAN KAWALAN KESELAMATAN DI SEKOLAH/INSTITUSI PENDIDIKAN',
//           style: 'title',
//         },
//         {
//           text: 'DI BAWAH KEMENTERIAN PENDIDIKAN MALAYSIA',
//           style: 'title',
//         },
//         '\n',
//         {
//           columns: [
//             {
//               text: [
//                 'NAMA SYARIKAT:',
//                 {
//                   text: process.env.SYARIKAT_NAME,
//                   fontSize: 8,
//                   decoration: 'underline',
//                   decorationStyle: 'dotted',
//                 },
//               ],
//               style: 'leftText',
//             },
//             {
//               text: [
//                 'ZON:',
//                 {
//                   text: process.env.ZONE,
//                   fontSize: 8,
//                   decoration: 'underline',
//                   decorationStyle: 'dotted',
//                 },
//               ],
//               style: 'rightText',
//             },
//           ],
//         },
//         {
//           text: [
//             'SEKOLAH/INSTITUSI PENDIDIKAN: ',
//             {
//               text: process.env.SEK_SKTU1,
//               fontSize: 8,
//               decoration: 'underline',
//               decorationStyle: 'dotted',
//             },
//           ],
//           style: 'leftText',
//         },
//       ],

//       // footer of the page
//       footer: [
//         {
//           text: 'Nota:',
//           style: 'footerTitle',
//         },
//         {
//           text: [
//             'Laporan Watchman Clock ini dijana secara digital dan pastikan cetakan tarikh dan masa clocking adalah jelas. Ruangan ',
//             {
//               text: 'tandangan Penyedia, Penyemak dan Pengesah hendaklah dilengkapkan di setiap helaian.',
//               fontSize: 7,
//               bold: true,
//             },
//           ],
//           style: 'subText',
//         },
//         '\n', // inline new
//         {
//           text: 'Peringatan:',
//           style: 'footerTitle',
//         },
//         {
//           text: 'Seksyen 18, Akta SPRM: “ Seseorang melakukan kesalahan jika dia memberi seseorang ejen, atau sebagai seorang ejen dia menggunakan, dengan niat hendak memperdayakan prinsipalnya, apa-apa resit, akaun atau dokumen lain yang berkenaan dengan prinsipalnya itu mempunyai kepentingan, dan yang dia mempunyai sebab untuk mempercayai mengandungi apa-apa pernyataan yang palsu atau silap atau tidak lengkap tentang apa-apa pernyataan yang palsu atau silap atau tidak lengkap tentang apa-apa butir matan, dan yang dimaksudkan untuk mengelirukan prinsipalnya.”',
//           style: 'subText',
//         },
//         '\n', // inline new
//         {
//           columns: [
//             {
//               text: 'Disediakan Oleh:',
//               style: 'sign',
//             },
//             {
//               text: 'Disemak Oleh:',
//               style: 'sign',
//             },
//             {
//               text: 'Disahkan Oleh:',
//               style: 'sign',
//             },
//           ],
//         },
//         '\n', // inline new
//         {
//           columns: [
//             {
//               text: '- - - - - - - -  - - - - - - - - ',
//               style: 'sign',
//             },
//             {
//               text: '- - - - - - - -  - - - - - - - -',
//               style: 'sign',
//             },
//             {
//               text: '- - - - - - - -  - - - - - - - -',
//               style: 'sign',
//             },
//           ],
//         },
//         '\n', // inline new
//         {
//           columns: [
//             {
//               text: '(Tandatangan & Cop Rasmi)',
//               style: 'below',
//             },
//             {
//               text: '(Tandatangan & Cop Rasmi)',
//               style: 'below',
//             },
//             {
//               text: '(Tandatangan & Cop Rasmi)',
//               style: 'below',
//             },
//           ],
//         },
//         {
//           text: 'Pengurus/Wakil Syarikat',
//           style: 'below',
//         },
//         '\n\n', // new inline
//         {
//           columns: [
//             {
//               text: 'Tarikh',
//               style: 'below',
//             },
//             {
//               text: 'Tarikh',
//               style: 'below',
//             },
//             {
//               text: 'Tarikh',
//               style: 'below',
//             },
//           ],
//         },
//         '\n\n', // new inline
//         {
//           text: 'DICETAK PADA: ',
//           style: 'sbRight',
//         },
//         {
//           text: 'NAMA: ' + summary.name,
//           style: 'sbRight',
//         },
//         {
//           text: 'NO. ID: ' + summary.id,
//           style: 'sbRight',
//         },
//       ],

//       // list of the content in the pdf where table is called
//       content: [
//         // _setSummaries(summary)
//       ],

//       // style font
//       defaultStyle: {
//         fontSize: 6,
//       },
//       styles: {
//         title: {
//           fontSize: 8,
//           alignment: 'center',
//         },
//         title2: {
//           fontSize: 8,
//           italics: true,
//           alignment: 'center',
//         },
//         title3: {
//           alignment: 'center',
//           fillColor: 'white',
//         },
//         leftText: {
//           fontSize: 8,
//           alignment: 'left',
//           margin: [40, 0, 0, 0],
//         },
//         // garisan putus2
//         sign: {
//           fontSize: 8,
//           alignment: 'left',
//           bold: true,
//           margin: [40, 0, 0, 0],
//         },
//         rightText: {
//           fontSize: 8,
//           alignment: 'right',
//           margin: [0, 0, 40, 0],
//         },
//         //bold footer title
//         footerTitle: {
//           fontSize: 7,
//           alignment: 'left',
//           bold: true,
//           margin: [40, 0, 0, 0],
//         },
//         subText: {
//           fontSize: 7,
//           alignment: 'justify',
//           margin: [40, 0, 40, 0],
//         },
//         // below pdf
//         below: {
//           fontSize: 6,
//           alignment: 'left',
//           margin: [40, 0, 0, 0],
//         },
//         subtopic: {
//           fontSize: 8,
//           bold: true,
//           italics: true,
//           alignment: 'center',
//         },
//         // small below footer right
//         sbRight: {
//           fontSize: 5,
//           alignment: 'right',
//           margin: [0, 0, 40, 0],
//         },
//         //small right top
//         stRight: {
//           fontSize: 5,
//           alignment: 'right',
//           margin: [0, 10, 20, 20],
//         },
//         nestHeader: {
//           alignment: 'center',
//           italics: true,
//           color: 'grey',
//         },
//         nestHeaderLeft: {
//           alignment: 'left',
//           italics: true,
//           color: 'grey',
//         },
//         centered: {
//           alignment: 'center',
//         },
//         completed: {
//           alignment: 'center',
//         },
//         incomplete: {
//           alignment: 'center',
//           color: 'red',
//         },
//       },
//     };
//     const pdfDoc = printer.createPdfKitDocument(dd);
//     const month = moment(summary.fromDate).format('MMMM');

//     const fileName = `${site}-${summary.datetime.format(
//       'YYYY-MM-DD',
//     )}-${month}.pdf`;
//     const filePath = `${configPrint.savePath}/${site}-${summary.datetime.format(
//       'YYYY-MM-DD',
//     )}-${month}.pdf`;

//     pdfDoc.pipe(
//       fs.createWriteStream(
//         `${configPrint.savePath}/${site}-${summary.datetime.format(
//           'YYYY-MM-DD',
//         )}-${month}.pdf`,
//       ),
//     );
//     pdfDoc.end();

//     const res = {
//       filename: fileName,
//       filepath: filePath,
//       date: summary.datetime.format('YYYY-MM-DD') + ' ' + summary.id,
//     };

//     return await Promise.resolve(res);
//   } catch (e) {
//     console.log(e);
//     return Promise.reject(e);
//   }
// };
